on:
  pull_request:
    branches:
      - feature/HT-51-55-CODEBASE
  push:
    branches:
      - feature/HT-51-55-CODEBASE

name: "Build & Release"
jobs:
  build:
    name: Build & Release
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v3

      - name: Set up Java
        uses: actions/setup-java@v4.3.0
        with:
          distribution: 'temurin'
          java-version: '19'

      - name: Set up Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable
          flutter-version: 3.24.3

      - name: Download google-services.json
        run: |
          curl -o android/app/google-services.json ${{ secrets.GOOGLE_SERVICES_JSON }}

      - name: Download firebase_options.dart
        run: |
          curl -o lib/firebase_options.dart ${{ secrets.FIREBASE_OPTIONS_DART }}

      - name: Read version from pubspec.yaml
        id: get_version
        run: |
          VERSION=$(grep 'version:' pubspec.yaml | sed 's/version: //')
          echo "VERSION=${VERSION}" >> $GITHUB_ENV
      
      - run: flutter build apk --release --dart-define=flavor=prod --flavor prod -t lib/main_prod.dart --obfuscate --split-debug-info=./release

      - run: |
          flutter build ios --no-codesign
          cd build/ios/iphoneos
          mkdir Payload
          cd Payload
          ln -s ../Runner.app
          cd ..
          zip -r app.ipa Payload

      - name: Check if Tag Exists
        id: check_tag
        run: |
          if git rev-parse "refs/tags/${{ env.VERSION }}" >/dev/null 2>&1; then
            echo "TAG=CICD.1.0.0+${{ github.run_number }}" >> $GITHUB_ENV
          else
            echo "TAG=${{ env.VERSION }}" >> $GITHUB_ENV
          fi

      - name: Push to Releases
        uses: ncipollo/release-action@v1
        with:
          artifacts: "build/app/outputs/flutter-apk/*.apk,build/ios/iphoneos/app.ipa"
          tag: ${{ env.TAG }}
          token: ${{ secrets.TOKEN_CICD }}

      - name: Upload APK and IPA as Artifacts
        uses: actions/upload-artifact@v3
        with:
          name: build-artifacts
          path: |
            build/app/outputs/flutter-apk/*.apk
            build/ios/iphoneos/app.ipa

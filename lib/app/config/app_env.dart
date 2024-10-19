import 'package:hi_toeic/app/config/app_constant.dart';

enum AppEnv { dev, prod }

extension AppEnvExt on AppEnv {
  bool get isDev => this == AppEnv.dev;
  bool get isProd => this == AppEnv.prod;

  String get appName {
    switch (this) {
      case AppEnv.dev:
        return AppConstant.devAppName;
      case AppEnv.prod:
        return AppConstant.appName;
    }
  }
}

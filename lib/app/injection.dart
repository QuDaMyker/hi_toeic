import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator_plus/translator_plus.dart';

final getIt = GetIt.instance;

void configureDependencies() async {
  configureHelper();
  configureController();
}

void configureHelper() async {
  getIt.registerSingleton<AudioPlayer>(AudioPlayer());
  getIt.registerSingleton<FlutterTts>(FlutterTts());
  getIt.registerSingleton<GoogleTranslator>(GoogleTranslator());
  getIt.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  await GetIt.instance.isReady<SharedPreferences>(); // Add this line
}

void configureController() async {}

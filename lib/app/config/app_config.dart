import 'package:hi_toeic/app/config/app_env.dart';

class AppConfig {
  final AppEnv appEnv;
  static AppConfig? _instance;

  factory AppConfig.init({required AppEnv env}) {
    _instance ??= AppConfig._internal(env);
    return _instance!;
  }

  AppConfig._internal(this.appEnv);

  static AppConfig get instance => _instance!;

  factory AppConfig.dev() => AppConfig.init(env: AppEnv.dev);
  factory AppConfig.prod() => AppConfig.init(env: AppEnv.prod);
}

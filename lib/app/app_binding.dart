import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_env.dart';

class AppBinding extends Bindings {
  final AppEnv env;

  AppBinding(this.env);
  @override
  void dependencies() {}
}

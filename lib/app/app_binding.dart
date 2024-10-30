import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_env.dart';
import 'package:hi_toeic/pages/auth/controller/auth_controller.dart';

class AppBinding extends Bindings {
  final AppEnv env;

  AppBinding(this.env);
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

import 'package:get/get.dart';
import 'package:hi_toeic/pages/auth/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

import 'package:get/get.dart';
import 'package:hi_toeic/pages/auth/controller/sign_up_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

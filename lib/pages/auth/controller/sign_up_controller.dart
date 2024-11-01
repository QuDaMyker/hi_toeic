import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/pages/auth/controller/auth_controller.dart';

class SignUpController extends GetxController {
  late final GlobalKey<FormState> formKeySignUp;
  late final TextEditingController emailController;
  late final TextEditingController fullNameController;
  late final TextEditingController passwordController;
  late final TextEditingController repeatPasswordController;
  final AuthController _authController = Get.find<AuthController>();
  AuthController get authController => _authController;
  @override
  void onInit() {
    formKeySignUp = GlobalKey<FormState>();
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    passwordController = TextEditingController();
    repeatPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    fullNameController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.onClose();
  }

  Future<void> onSignUp() async {
    await _authController.onSignUp(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      fullname: fullNameController.text.trim(),
    );
  }
}

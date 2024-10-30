import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/pages/auth/controller/auth_controller.dart';

class ForgotPasswordController extends GetxController {
  late final GlobalKey<FormState> formKeyLogin;
  late final TextEditingController emailController;
  final AuthController _authController = Get.find<AuthController>();

  AuthController get authController => _authController;
  @override
  void onInit() {
    formKeyLogin = GlobalKey<FormState>();
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  Future<void> onForgotPassword() async {
    await _authController.forgotPassword(
      email: emailController.text.trim(),
    );
  }
}

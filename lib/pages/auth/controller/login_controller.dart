import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/pages/auth/controller/auth_controller.dart';

class LoginController extends GetxController {
  late final GlobalKey<FormState> formKeyLogin;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final AuthController _authController = Get.find<AuthController>();

  AuthController get authController => _authController;

  @override
  void onInit() {
    formKeyLogin = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> onAuthGoogle() async {
    await _authController.onGoogleAuth();
  }

  Future<void> onLoginEmail() async {
    await _authController.onLogin(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}

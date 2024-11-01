import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_colors.dart';
import 'package:hi_toeic/common/utils/helper.dart';
import 'package:hi_toeic/data/constant/image_assets.dart';
import 'package:hi_toeic/pages/auth/controller/login_controller.dart';
import 'package:hi_toeic/pages/auth/widgets/email_text_field.dart';
import 'package:hi_toeic/pages/auth/widgets/password_text_field.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: -200,
                left: -Get.width * 0.12,
                child: _buildBackground(),
              ),
              Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildLogoLogin(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildDivider(),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildButtonGoogle(onClick: () async {
                        await controller.onAuthGoogle();
                      }),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildNavigateSignUp(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildNavigateSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'dont_have_account'.tr,
          style: const TextStyle(
            color: AppColors.gray20,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary40,
          ),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (context) => const SignUpPage(),
            //   ),
            // );
          },
          child: Text(
            'sign_up_now'.tr,
            style: const TextStyle(
              color: AppColors.primary40,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonGoogle({required Function onClick}) {
    return GestureDetector(
      onTap: () async {
        onClick();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(width: 1, color: AppColors.gray20),
            bottom: BorderSide(width: 1, color: AppColors.gray20),
            right: BorderSide(width: 1, color: AppColors.gray20),
            left: BorderSide(width: 1, color: AppColors.gray20),
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageAssets.icGoogle),
            const SizedBox(
              width: 4,
            ),
            Text(
              'login_with_google'.tr,
              style: const TextStyle(
                color: AppColors.primary40,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildBackground() {
    return Container(
      width: Get.width * 2,
      height: Get.width * 2,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary40,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.primary40,
            AppColors.primary50,
          ],
        ),
      ),
    );
  }

  Padding _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            flex: 2,
            child: Divider(
              color: AppColors.gray20,
              height: 1,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'or'.tr,
              style: const TextStyle(
                color: Color.fromRGBO(132, 132, 132, 1),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            flex: 2,
            child: Divider(
              color: AppColors.gray20,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildFormField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: const Border(
          top: BorderSide(width: 0.5, color: AppColors.gray60),
          bottom: BorderSide(width: 0.5, color: AppColors.gray60),
          right: BorderSide(width: 0.5, color: AppColors.gray60),
          left: BorderSide(width: 0.5, color: AppColors.gray60),
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Form(
        key: controller.formKeyLogin,
        child: Column(
          children: [
            EmailTextField(
              controller: controller.emailController,
              prefixIcon: ImageAssets.icEmail,
              title: 'email'.tr,
              authController: controller.authController,
              onValidate: (p0) => Helper.instance.isValidEmail(email: p0),
              errorMessage: 'please_enter_valid_email'.tr,
            ),
            const SizedBox(
              height: 20,
            ),
            PasswordTextField(
              controller: controller.passwordController,
              prefixIcon: ImageAssets.icPassword,
              title: 'password'.tr,
              authController: controller.authController,
              onValidate: (p0) => Helper.instance.isValidPassword(password: p0),
              errorMessage: 'password_requirements'.tr,
            ),
            _buildButtonForgotPassword(),
            _buildButtonLogin(),
          ],
        ),
      ),
    );
  }

  Align _buildButtonForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary40,
        ),
        onPressed: () async {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => ForgotPasswordPage(),
          //   ),
          // );
        },
        child: Text(
          'forgot_password'.tr,
          style: const TextStyle(
            color: AppColors.primary40,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return controller.authController.isLoadingLogin.value
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary40,
            ),
          )
        : GestureDetector(
            onTap: () async {
              if (controller.formKeyLogin.currentState!.validate()) {
                controller.formKeyLogin.currentState!.save();
                await controller.onLoginEmail();
              }
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: AppColors.secondary20,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'login'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Column _buildLogoLogin() {
    return Column(
      children: [
        SvgPicture.asset(
          ImageAssets.icAuth,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'welcome_back'.tr,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        Text(
          'login_to_your_account'.tr,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

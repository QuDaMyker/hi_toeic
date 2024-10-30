import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_colors.dart';
import 'package:hi_toeic/app/routes/app_pages.dart';
import 'package:hi_toeic/common/utils/helper.dart';
import 'package:hi_toeic/data/constant/image_assets.dart';
import 'package:hi_toeic/pages/auth/controller/sign_up_controller.dart';
import 'package:hi_toeic/pages/auth/widgets/custom_text_field.dart';
import 'package:hi_toeic/pages/auth/widgets/email_text_field.dart';
import 'package:hi_toeic/pages/auth/widgets/password_text_field.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -200,
              left: -Get.width * 0.2,
              child: _buildBackground(colors: [
                AppColors.secondary80,
                AppColors.primary40,
                AppColors.secondary80,
              ]),
            ),
            Positioned(
              bottom: -200,
              left: -Get.width * 0.12,
              child: _buildBackground(
                colors: [
                  AppColors.primary40,
                  AppColors.primary50,
                  AppColors.primary40,
                ],
              ),
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
                    _buildNavigateLogIn(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildNavigateLogIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          'have_account'.tr,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary40,
          ),
          onPressed: () {
            Get.toNamed(AppRoutes.login);
          },
          child: Text(
            'login_now'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Container _buildBackground({required List<Color> colors}) {
    return Container(
      width: Get.width * 2,
      height: Get.width * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary40,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: colors,
        ),
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
        key: controller.formKeySignUp,
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
            CustomTextField(
              controller: controller.fullNameController,
              prefixIcon: ImageAssets.icFullName,
              title: 'full_name'.tr,
              authController: controller.authController,
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
            const SizedBox(
              height: 20,
            ),
            PasswordTextField(
              controller: controller.repeatPasswordController,
              prefixIcon: ImageAssets.icPassword,
              title: 'confirm_password'.tr,
              authController: controller.authController,
              onValidate: (p0) => Helper.instance.isValidPassword(password: p0),
              errorMessage: 'password_requirements'.tr,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildButtonSignUp(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSignUp() {
    return Obx(
      () => controller.authController.isLoadingSignUp.value
          ? const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary40,
              ),
            )
          : GestureDetector(
              onTap: () async {
                if (controller.formKeySignUp.currentState!.validate()) {
                  controller.formKeySignUp.currentState!.save();
                  await controller.onSignUp();
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
                        'sign_up'.tr,
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
          'sign_up'.tr,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        Text(
          'create_new_account'.tr,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

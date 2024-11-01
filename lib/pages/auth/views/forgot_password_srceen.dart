import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_colors.dart';
import 'package:hi_toeic/common/utils/helper.dart';
import 'package:hi_toeic/data/constant/image_assets.dart';
import 'package:hi_toeic/pages/auth/controller/forgot_password_controller.dart';
import 'package:hi_toeic/pages/auth/widgets/email_text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
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
                  ],
                ),
              ),
            ),
          ],
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
        key: controller.formKeyLogin,
        child: Column(
          children: [
            EmailTextField(
              controller: controller.emailController,
              prefixIcon: ImageAssets.icEmail,
              title: 'email_registered'.tr,
              authController: controller.authController,
              onValidate: (value) => Helper.instance.isValidEmail(email: value),
              errorMessage: 'please_enter_valid_email'.tr,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildButtonLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return Obx(
      () => controller.authController.isLoadingForgotPassword.value
          ? Center(
              child: LoadingAnimationWidget.discreteCircle(
                secondRingColor: AppColors.secondary20,
                thirdRingColor: AppColors.gray40,
                color: AppColors.primary40,
                size: 30,
              ),
            )
          : GestureDetector(
              onTap: () async {
                if (controller.formKeyLogin.currentState!.validate()) {
                  controller.formKeyLogin.currentState!.save();
                  await controller.onForgotPassword();
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
          'request_forgot_password'.tr,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        Text(
          'we_are_here_to_help'.tr,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
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
}

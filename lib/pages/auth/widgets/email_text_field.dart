import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_colors.dart';
import 'package:hi_toeic/pages/auth/controller/auth_controller.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.title,
    required this.controller,
    required this.prefixIcon,
    required this.authController,
    required this.errorMessage,
    required this.onValidate,
  });

  final String title;
  final TextEditingController controller;
  final String prefixIcon;
  final AuthController authController;

  final String errorMessage;
  final bool Function(String) onValidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
        () => TextFormField(
          enabled: !authController.isLoadingLogin.value,
          controller: controller,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'please_fill_information'.tr;
            }
            if (!onValidate(value)) {
              return errorMessage;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: AppColors.primary40,
          style: const TextStyle(color: AppColors.gray40, fontSize: 16),
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.circular(12),
            ),
            errorMaxLines: 3,
            hintText: ' $title',
            isDense: false,
            hintStyle: const TextStyle(
              color: AppColors.gray40,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray40),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.gray40),
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                prefixIcon,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_colors.dart';
import 'package:hi_toeic/data/constant/image_assets.dart';
import 'package:hi_toeic/pages/splash_page/splash_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(ImageAssets.icSplash),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Talk Share',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'app_for_vietnamese'.tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary40,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: LoadingAnimationWidget.discreteCircle(
                  secondRingColor: AppColors.secondary20,
                  thirdRingColor: AppColors.gray40,
                  color: AppColors.primary40,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

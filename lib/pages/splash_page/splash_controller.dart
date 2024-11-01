import 'package:get/get.dart';
import 'package:hi_toeic/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.toNamed(AppRoutes.login);
    super.onReady();
  }
}

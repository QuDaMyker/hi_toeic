import 'package:get/get.dart';
import 'package:hi_toeic/app/page/splash_page/splash_binding.dart';
import 'package:hi_toeic/app/page/splash_page/splash_page.dart';
import 'package:hi_toeic/pages/home/bindings/home_binding.dart';
import 'package:hi_toeic/pages/home/views/home_view.dart';
import 'package:hi_toeic/pages/login/login_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.splash;

  static final routes = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    )
  ];
}

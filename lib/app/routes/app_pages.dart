import 'package:get/get.dart';
import 'package:hi_toeic/pages/auth/bindings/forgot_password_binding.dart';
import 'package:hi_toeic/pages/auth/bindings/signup_binding.dart';
import 'package:hi_toeic/pages/auth/views/forgot_password_srceen.dart';
import 'package:hi_toeic/pages/auth/views/sign_up_screen.dart';
import 'package:hi_toeic/pages/home/bindings/home_binding.dart';
import 'package:hi_toeic/pages/home/views/home_view.dart';
import 'package:hi_toeic/pages/splash_page/splash_binding.dart';
import 'package:hi_toeic/pages/splash_page/splash_page.dart';
import 'package:hi_toeic/pages/auth/bindings/login_binding.dart';
import 'package:hi_toeic/pages/auth/views/login_screen.dart';
part 'app_routes.dart';

abstract class AppPages {
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
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}

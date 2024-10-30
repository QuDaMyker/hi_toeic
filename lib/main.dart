import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_toeic/app/app_binding.dart';
import 'package:hi_toeic/app/config/app_config.dart';
import 'package:hi_toeic/app/config/app_constant.dart';
import 'package:hi_toeic/app/config/app_theme.dart';
import 'package:hi_toeic/app/lang/translate_service.dart';
import 'app/routes/app_pages.dart';

class HiToeic extends StatelessWidget {
  final AppConfig appConfig;
  const HiToeic({
    super.key,
    required this.appConfig,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstant.designSize,
      builder: (context, child) => GetMaterialApp(
        title: appConfig.appEnv.name,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 200),
        initialBinding: AppBinding(appConfig.appEnv),
        theme: dartTheme,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
        getPages: AppPages.routes,
        supportedLocales: AppConstant.appSupportLocale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate
        ],
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}

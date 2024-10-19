import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hi_toeic/app/config/app_constant.dart';
import 'package:hi_toeic/app/lang/en_us.dart';
import 'package:hi_toeic/app/lang/vi_vn.dart';

class TranslationService extends Translations {
  static Locale get locale => AppConstant.appSupportLocale.first;
  static Locale get fallbackLocale => AppConstant.appSupportLocale.last;

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'vi_VN': viVN,
      };
}

import 'package:flutter/widgets.dart';
import 'package:hi_toeic/app/config/app_config.dart';
import 'package:hi_toeic/app/config/app_init.dart';
import 'package:hi_toeic/main.dart';

void main() async {
  await AppInit.init(isProd: true);

  runApp(HiToeic(appConfig: AppConfig.prod()));
}

import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hi_toeic/app/config/app_remote_config.dart';
import 'package:hi_toeic/app/config/remoteConfig/configuration.dart';
import 'package:hi_toeic/app/injection.dart';
import 'package:hi_toeic/common/api/api_supabase.dart';
import 'package:hi_toeic/firebase_options.dart';

class AppInit {
  late final bool isProd;

  static init({required bool isProd}) async {
    log('[ADMIN] Running app in ${isProd ? 'production' : 'development'} mode',
        name: 'main');

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final remoteConfig = await AppRemoteConfig.getRemoteConfig();

    if (remoteConfig != null) {
      Configurations().setConfigurationValues(
        remoteConfig.data as Map<String, RemoteConfigValue>,
      );

      log(Configurations.anonPublic);

      if (isProd) {
        SupabaseService.instance.init(
          url: Configurations.hostDatabaseProd[0].supabaseUrl!,
          anonKey: Configurations.hostDatabaseProd[0].anonKey!,
        );
      } else {
        SupabaseService.instance.init(
          url: Configurations.hostDatabaseDev[0].supabaseUrl!,
          anonKey: Configurations.hostDatabaseDev[0].anonKey!,
        );
      }
    }

    await ScreenUtil.ensureScreenSize();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    configureDependencies();
  }
}

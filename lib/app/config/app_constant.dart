import 'package:flutter/material.dart';

abstract class AppConstant {
  // app_name
  static const String devAppName = '[DEV] HI TOEIC';
  static const String appName = '[PROD] HI TOEIC';

// country_code_language
  static const viVN = 'vi_VN';
  static const enUS = 'en_US';

  // locale
  static const appSupportLocale = [
    Locale('vi', 'VN'),
    Locale('en', 'EN'),
  ];

  // connection timeout
  static const Duration connectTimeout = Duration(seconds: 60);

  // datetime format
  static const String dateFormat = 'dd.MM.yyyy';

  //design size
  static const designSize = Size(76.7, 159.9);

  // hostDatabase
  static const hostDatabasekey = 'host_database';
  static const nameHostDatabaseKey = 'name';
  static const connectStringHostDatabaseKey = 'connect_string';
  static const hostHostDatabaseKey = 'host';
  static const databaseNameHostDatabaseKey = 'database_name';
  static const portHostDatabaseKey = 'port';
  static const userHostDatabaseKey = 'user';
  static const passwordHostDatabaseKey = 'password';

  // remoteConfig key
  static const environmentKey = 'environment';
  static const anonPublic = 'anon_public';
  static const connectStringDev = 'connect_string_dev';
  static const databasePassword = 'database_password';
  static const hostDatabaseDev = 'host_database_dev';
  static const hostDatabaseProd = 'host_database_prod';
  static const jwtSecret = 'jwt_secret';
  static const projectName = 'project_name';
  static const projectUrl = 'project_url';
  static const serviceRole = 'service_role';
  static const supabaseUrl = 'url';
  static const anonKey = 'anon_key';
}

import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hi_toeic/app/config/app_constant.dart';
import 'package:hi_toeic/app/config/remoteConfig/default_config.dart';
import 'package:hi_toeic/common/utils/helper.dart';
import 'package:hi_toeic/data/model/database_config.dart';

class Configurations {
  static String _environment = DefaultConfig.environment;
  static String _jwtSecret = DefaultConfig.jwtSecret;
  static String _anonPublic = DefaultConfig.anonPublic;
  static String _connectStringDev = DefaultConfig.connectStringDev;
  static String _databasePassword = DefaultConfig.databasePassword;
  static String _projectName = DefaultConfig.projectName;
  static String _projectUrl = DefaultConfig.projectUrl;

  static List<DatabaseConfig> _hostDatabaseDev = DefaultConfig.hostDatabaseDev;
  static List<DatabaseConfig> _hostDatabaseProd =
      DefaultConfig.hostDatabaseProd;

  static String get environment => _environment;
  static String get jwtSecret => _jwtSecret;
  static String get anonPublic => _anonPublic;
  static String get connectStringDev => _connectStringDev;
  static String get databasePassword => _databasePassword;
  static String get projectName => _projectName;
  static String get projectUrl => _projectUrl;

  static List<DatabaseConfig> get hostDatabaseDev => _hostDatabaseDev;
  static List<DatabaseConfig> get hostDatabaseProd => _hostDatabaseProd;

  void setConfigurationValues(Map<String, RemoteConfigValue> value) {
    _environment = value[AppConstant.environmentKey]?.asString() ??
        DefaultConfig.environment;
    _jwtSecret =
        value[AppConstant.jwtSecret]?.asString() ?? DefaultConfig.jwtSecret;
    _anonPublic =
        value[AppConstant.anonPublic]?.asString() ?? DefaultConfig.anonPublic;
    _connectStringDev = value[AppConstant.connectStringDev]?.asString() ??
        DefaultConfig.connectStringDev;
    _databasePassword = value[AppConstant.databasePassword]?.asString() ??
        DefaultConfig.databasePassword;
    _projectName =
        value[AppConstant.projectName]?.asString() ?? DefaultConfig.projectName;
    _projectUrl =
        value[AppConstant.anonPublic]?.asString() ?? DefaultConfig.projectUrl;

    // if (value[AppConstant.hostDatabaseDev] != null) {
    //   final map = json.decode(value[AppConstant.hostDatabaseDev]!.asString())
    //       as Map<String, dynamic>;

    //   final list = map[AppConstant.hostDatabasekey] as List;

    //   if (map[AppConstant.hostDatabasekey] is List) {
    //     _hostDatabaseDev =
    //         list.map((item) => DatabaseConfig.fromMap(item)).toList();
    //   } else {
    //     _hostDatabaseDev = DefaultConfig.hostDatabaseDev;
    //   }
    // } else {
    //   _hostDatabaseDev = DefaultConfig.hostDatabaseDev;
    // }

    _hostDatabaseDev = Helper.decodeDatabaseConfigList(
      value[AppConstant.hostDatabaseDev]?.asString(),
      DefaultConfig.hostDatabaseDev,
    );

    _hostDatabaseProd = Helper.decodeDatabaseConfigList(
      value[AppConstant.hostDatabaseProd]?.asString(),
      DefaultConfig.hostDatabaseProd,
    );
  }
}

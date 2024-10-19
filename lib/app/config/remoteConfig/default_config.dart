import 'package:hi_toeic/app/config/app_constant.dart';
import 'package:hi_toeic/data/model/database_config.dart';

class DefaultConfig {
  static const String environment = 'dev';
  static final List<DatabaseConfig> hostDatabaseDev = [
    DatabaseConfig.fromMap({
      AppConstant.nameHostDatabaseKey: 'nameHostDatabaseKey',
      AppConstant.connectStringHostDatabaseKey: 'connectStringHostDatabaseKey',
      AppConstant.hostHostDatabaseKey: 'hostHostDatabaseKey',
      AppConstant.databaseNameHostDatabaseKey: 'databaseNameHostDatabaseKey',
      AppConstant.portHostDatabaseKey: 5432,
      AppConstant.userHostDatabaseKey: 'userHostDatabaseKey',
      AppConstant.passwordHostDatabaseKey: 'passwordHostDatabaseKey',
      AppConstant.supabaseUrl: 'url',
      AppConstant.anonKey: 'url',
    }),
  ];

  static final List<DatabaseConfig> hostDatabaseProd = [
    DatabaseConfig.fromMap({
      AppConstant.nameHostDatabaseKey: 'nameHostDatabaseKey',
      AppConstant.connectStringHostDatabaseKey: 'connectStringHostDatabaseKey',
      AppConstant.hostHostDatabaseKey: 'hostHostDatabaseKey',
      AppConstant.databaseNameHostDatabaseKey: 'databaseNameHostDatabaseKey',
      AppConstant.portHostDatabaseKey: 5432,
      AppConstant.userHostDatabaseKey: 'userHostDatabaseKey',
      AppConstant.passwordHostDatabaseKey: 'passwordHostDatabaseKey',
      AppConstant.supabaseUrl: 'url',
      AppConstant.anonKey: 'anon',
    }),
  ];

  static const String jwtSecret = 'jwt_secret_value';
  static const String serviceRole = 'service_role_value';

  static const String anonPublic = 'anon_public_value';
  static const String connectStringDev = 'connect_string_dev_value';
  static const String databasePassword = 'database_password_value';
  static const String projectName = 'project_name_value';
  static const String projectUrl = 'project_url_value';
}

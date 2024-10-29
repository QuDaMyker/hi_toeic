import 'dart:convert';

import 'package:hi_toeic/app/config/app_constant.dart';

class DatabaseConfig {
  final String? name;
  final String? connectString;
  final String? host;
  final String? databaseName;
  final int? port;
  final String? user;
  final String? password;
  final String? supabaseUrl;
  final String? anonKey;
  DatabaseConfig({
    this.name,
    this.connectString,
    this.host,
    this.databaseName,
    this.port,
    this.user,
    this.password,
    this.supabaseUrl,
    this.anonKey,
  });

  DatabaseConfig copyWith({
    String? name,
    String? connectString,
    String? host,
    String? databaseName,
    int? port,
    String? user,
    String? password,
    String? supabaseUrl,
    String? anonKey,
  }) {
    return DatabaseConfig(
      name: name ?? this.name,
      connectString: connectString ?? this.connectString,
      host: host ?? this.host,
      databaseName: databaseName ?? this.databaseName,
      port: port ?? this.port,
      user: user ?? this.user,
      password: password ?? this.password,
      supabaseUrl: supabaseUrl ?? this.supabaseUrl,
      anonKey: anonKey ?? this.anonKey,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      AppConstant.nameHostDatabaseKey: name,
      AppConstant.connectStringHostDatabaseKey: connectString,
      AppConstant.hostHostDatabaseKey: host,
      AppConstant.databaseNameHostDatabaseKey: databaseName,
      AppConstant.portHostDatabaseKey: port,
      AppConstant.userHostDatabaseKey: user,
      AppConstant.passwordHostDatabaseKey: password,
      AppConstant.supabaseUrl: supabaseUrl,
      AppConstant.anonKey: anonKey,
    };
  }

  factory DatabaseConfig.fromMap(Map<String, dynamic> map) {
    return DatabaseConfig(
      name: map[AppConstant.nameHostDatabaseKey] != null
          ? map[AppConstant.nameHostDatabaseKey] as String
          : null,
      connectString: map[AppConstant.connectStringHostDatabaseKey] != null
          ? map[AppConstant.connectStringHostDatabaseKey] as String
          : null,
      host: map[AppConstant.hostHostDatabaseKey] != null
          ? map[AppConstant.hostHostDatabaseKey] as String
          : null,
      databaseName: map[AppConstant.databaseNameHostDatabaseKey] != null
          ? map[AppConstant.databaseNameHostDatabaseKey] as String
          : null,
      port: map[AppConstant.portHostDatabaseKey] != null
          ? map[AppConstant.portHostDatabaseKey] as int
          : null,
      user: map[AppConstant.userHostDatabaseKey] != null
          ? map[AppConstant.userHostDatabaseKey] as String
          : null,
      password: map[AppConstant.passwordHostDatabaseKey] != null
          ? map[AppConstant.passwordHostDatabaseKey] as String
          : null,
      supabaseUrl: map[AppConstant.supabaseUrl] != null
          ? map[AppConstant.supabaseUrl] as String
          : null,
      anonKey: map[AppConstant.anonKey] != null
          ? map[AppConstant.anonKey] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DatabaseConfig.fromJson(String source) =>
      DatabaseConfig.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DatabaseConfig(name: $name, connectString: $connectString, host: $host, databaseName: $databaseName, port: $port, user: $user, password: $password, supabaseUrl: $supabaseUrl, anonKey: $anonKey)';
  }

  @override
  bool operator ==(covariant DatabaseConfig other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.connectString == connectString &&
        other.host == host &&
        other.databaseName == databaseName &&
        other.port == port &&
        other.user == user &&
        other.password == password &&
        other.supabaseUrl == supabaseUrl &&
        other.anonKey == anonKey;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        connectString.hashCode ^
        host.hashCode ^
        databaseName.hashCode ^
        port.hashCode ^
        user.hashCode ^
        password.hashCode ^
        supabaseUrl.hashCode ^
        anonKey.hashCode;
  }
}

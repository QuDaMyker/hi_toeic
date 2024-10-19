import 'dart:convert';

import 'package:hi_toeic/app/config/app_constant.dart';
import 'package:hi_toeic/data/model/database_config.dart';

abstract class Helper {
  static List<DatabaseConfig> decodeDatabaseConfigList(
      String? jsonString, List<DatabaseConfig> defaultValue) {
    if (jsonString == null || jsonString.isEmpty) {
      return defaultValue;
    }

    try {
      final map = json.decode(jsonString) as Map<String, dynamic>;
      final list =
          map[AppConstant.hostDatabasekey] as List?; // Use a nullable type

      // Check if the list exists and is not empty
      if (list != null && list.isNotEmpty) {
        return list.map((item) => DatabaseConfig.fromMap(item)).toList();
      } else {
        return defaultValue;
      }
    } catch (_) {
      return defaultValue;
    }
  }
}

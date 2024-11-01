import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hi_toeic/data/model/remote_config_model.dart';

class AppRemoteConfig {
  static Future<RemoteConfigModel?> getRemoteConfig() async {
    try {
      final remoteConfig = FirebaseRemoteConfig.instance;

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: Duration.zero,
        ),
      );

      await remoteConfig.fetchAndActivate();

      final allValues = remoteConfig.getAll();
      return RemoteConfigModel(
        data: allValues,
      );
      // print(allowFetchRemoteConfig);

      // if (allowFetchRemoteConfig) {
      //   final allValues = remoteConfig.getAll();
      //   return RemoteConfigModel(
      //     data: allValues,
      //   );
      // }
      // return null;
    } catch (e) {
      print('Error fetching remote config: $e');
      return null;
    }
  }
}

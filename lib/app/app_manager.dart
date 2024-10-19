import 'package:hi_toeic/data/model/remote_config_model.dart';

class AppManager {
  static final AppManager _instance = AppManager._internal();

  factory AppManager() => _instance;

  AppManager._internal();

  late RemoteConfigModel remoteConfigModel;

  bool get isLogged => true;
}

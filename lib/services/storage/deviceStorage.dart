import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/locator.dart';

@module
abstract class DeviceStorageServiceAbstract {
  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}

@singleton
class ZDeviceStorage {
  late SharedPreferences _prefs;

  ZDeviceStorage() {
    _prefs = locator<SharedPreferences>();
  }

  Future clearData() {
    return _prefs.clear();
  }

  Future setString(key, value) async {
    return _prefs.setString(key, value);
  }

  String getString(key) {
    return _prefs.getString(key) ?? "";
  }

  Future setBool(key, value) async {
    return _prefs.setBool(key, value);
  }

  bool getBool(key) {
    return _prefs.getBool(key) ?? false;
  }

  Future setInt(key, value) async {
    return _prefs.setInt(key, value);
  }

  int getInt(key) {
    return _prefs.getInt(key) ?? 0;
  }
}

class DeviceStorageKeys {
  static const String testResultsCompleteSynced = "";
  static const String productsCompleteSynced = "";
}

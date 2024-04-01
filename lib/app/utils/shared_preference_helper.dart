import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String key, String value) async {
    return await _sharedPreferences.setString(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _sharedPreferences.setInt(key, value);
  }

  static int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  static Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}

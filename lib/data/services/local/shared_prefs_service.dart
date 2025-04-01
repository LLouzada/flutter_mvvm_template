import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }
}

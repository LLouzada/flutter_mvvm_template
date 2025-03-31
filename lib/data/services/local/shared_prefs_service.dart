import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
}

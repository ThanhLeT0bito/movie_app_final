import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String KEY_USER_ID = 'user_id';

  static Future<String> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY_USER_ID) ?? '';
  }

  static Future<void> setUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_USER_ID, userId);
  }
}

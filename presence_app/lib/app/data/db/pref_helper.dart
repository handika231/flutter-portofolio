import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const key = 'isLogin';
  static Future setLogin(bool isLogin) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, isLogin);
  }

  static Future<bool> get isLogin async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }
}

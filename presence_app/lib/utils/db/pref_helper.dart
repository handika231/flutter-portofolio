import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static const key = 'isLogin';
  Future setLogin(bool isLogin) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, isLogin);
  }

  Future<bool> get isLogin async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key) ?? false;
  }
}

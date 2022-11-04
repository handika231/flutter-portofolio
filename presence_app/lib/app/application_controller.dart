import 'package:get/get.dart';
import 'package:presence_app/utils/db/pref_helper.dart';

class ApplicationController extends GetxController {
  final PrefHelper _pref;
  ApplicationController(this._pref) {
    checkLogin();
  }

  RxBool isLogin = false.obs;

  Future checkLogin() async {
    isLogin.value = await _pref.isLogin;
  }
}

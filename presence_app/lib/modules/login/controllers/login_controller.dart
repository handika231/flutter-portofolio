import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presence_app/routes/navigation.dart';
import 'package:presence_app/utils/db/pref_helper.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final PrefHelper _pref;
  LoginController(this._pref);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //form key
  final loginForm = GlobalKey<FormState>(debugLabel: '_loginForm');
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _pref.setLogin(true);
      emailController.clear();
      passwordController.clear();
      Navigation.navigateAReplacement(Routes.MAIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
          title: 'Something Wrong',
          middleText: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Something Wrong',
          middleText: 'Wrong password provided for that user.',
        );
      }
    }
  }
}
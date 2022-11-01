import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../../../data/db/pref_helper.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //form key
  final loginForm = GlobalKey<FormState>();
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
      PrefHelper.setLogin(true);

      Get.offAllNamed(Routes.HOME);
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

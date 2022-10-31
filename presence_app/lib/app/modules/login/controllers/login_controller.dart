import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //form key
  final loginFormKey = GlobalKey<FormState>();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: 'Error! Email Verification',
          middleText: 'Please check your email to continue login',
        );
      }
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

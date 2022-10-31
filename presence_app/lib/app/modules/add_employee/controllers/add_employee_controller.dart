import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEmployeeController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController nipController;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    nameController = TextEditingController();
    nipController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    nameController.dispose();
    nipController.dispose();
  }

  //form key
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future addEmployee() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: 'password',
      );
      String uid = userCredential.user!.uid;
      firestore.collection('employee').doc(uid).set({
        'name': nameController.text,
        'nip': nipController.text,
        'email': emailController.text,
        'uid': uid,
        'createdAt': DateTime.now().toIso8601String(),
      });
      print('success : $userCredential');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
          title: 'Something Wrong',
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
          title: 'Something Wrong',
          middleText: 'The account already exists for that email.',
        );
      }
    }
  }
}

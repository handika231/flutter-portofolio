import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddEmployeeController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController nipController;
  GlobalKey<FormState> employeeFormKey =
      GlobalKey<FormState>(debugLabel: 'Employee');

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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future addEmployee() async {
    try {
      User? currentUser = _auth.currentUser;
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: 'password',
      );
      String uid = userCredential.user!.uid;
      await firestore.collection('employee').doc(uid).set({
        'name': nameController.text,
        'nip': nipController.text,
        'email': emailController.text,
        'uid': uid,
        'role': 'employee',
        'createdAt': DateTime.now().toIso8601String(),
      });
      await _auth.signOut();
      await _auth.signInWithEmailAndPassword(
        email: currentUser!.email!,
        password: 'password',
      );

      //send email verification
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
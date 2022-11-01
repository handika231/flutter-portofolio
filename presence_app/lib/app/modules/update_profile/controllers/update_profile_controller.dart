import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'form update profile');

  TextEditingController nameController = TextEditingController();
  TextEditingController nipController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  File? imageFile;

  Future pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
    } else {
      debugPrint('No image selected.');
    }
    update();
  }

  @override
  void dispose() {
    nameController.dispose();
    nipController.dispose();
    super.dispose();
  }

  Future updateProfile() async {
    if (formKey.currentState!.validate()) {
      //update profile
      String uid = auth.currentUser!.uid;
      await firestore.collection('employee').doc(uid).update({
        'name': nameController.text,
      });
      Get.defaultDialog(
        title: 'Success',
        middleText: 'Profile has been updated',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    }
  }
}

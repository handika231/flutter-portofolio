import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final ImagePicker picker;
  final FirebaseStorage storage;

  UpdateProfileController(
      {required this.auth,
      required this.firestore,
      required this.picker,
      required this.storage});
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: 'form update profile');

  late TextEditingController nameController;
  late TextEditingController nipController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    nipController = TextEditingController();
  }

  File? imageFile;

  Future pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imageFile = File(image.path);
    Get.snackbar(
      'Foto Profile sudah diperbarui',
      'Silahkan simpan perubahan',
      backgroundColor: Colors.white,
      colorText: Colors.black,
    );
    update();
  }

  Future uploadImage() async {
    if (imageFile != null) {
      final String fileName = auth.currentUser!.uid;
      final Reference ref = storage.ref().child(fileName);
      final UploadTask uploadTask = ref.putFile(imageFile!);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = (await downloadUrl.ref.getDownloadURL());
      return url;
    }
    update();
  }

  @override
  void dispose() {
    nameController.dispose();
    nipController.dispose();
    super.dispose();
  }

  Future<void> updateProfile() async {
    if (formKey.currentState!.validate()) {
      String uid = auth.currentUser!.uid;
      String profile = await uploadImage();
      await firestore.collection('employee').doc(uid).update({
        'name': nameController.text,
        'profile': profile,
      });
      Get.defaultDialog(
        title: 'Berhasil',
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back();
            },
            child: const Text('OK'),
          ),
        ],
        middleText: 'Profile kamu sudah di perbarui',
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  final args = Get.arguments;
  UpdateProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.nameController.text = args['name'];
    controller.nipController.text = args['nip'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateProfileView'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              enabled: false,
              readOnly: true,
              validator: (value) => value!.isEmpty ? 'Please enter NIP' : null,
              controller: controller.nipController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'NIP',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Please enter name' : null,
              controller: controller.nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.updateProfile();
                }
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

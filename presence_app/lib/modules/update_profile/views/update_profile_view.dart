import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends StatelessWidget {
  final args = Get.arguments;
  UpdateProfileView({Key? key}) : super(key: key);
  final controller = Get.put(di.locator<UpdateProfileController>());
  @override
  Widget build(BuildContext context) {
    controller.nameController.text = args['name'];
    controller.nipController.text = args['nip'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
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
            GetBuilder<UpdateProfileController>(
              builder: (value) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          args['profile'] != null
                              ? ClipOval(
                                  child: Image.network(
                                    args['profile'],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : value.imageFile == null
                                  ? const Text('No Image')
                                  : ClipOval(
                                      child: Image.file(
                                        value.imageFile!,
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          value.pickImage();
                        },
                        child: const Text('Choose Image'),
                      ),
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/common/extension.dart';
import 'package:presence_app/common/style.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends StatelessWidget {
  AddEmployeeView({Key? key}) : super(key: key);
  final controller = Get.put(di.locator<AddEmployeeController>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 30,
          ),
          child: Form(
            key: controller.employeeFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Add Employee',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(
                    thickness: 1.2,
                    color: blackColor,
                    indent: 50,
                    endIndent: 50,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'add-employee'.toPNG,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter NIP' : null,
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
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter name' : null,
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter email' : null,
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(Get.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () async {
                      if (controller.employeeFormKey.currentState!.validate()) {
                        controller.addEmployee();
                      } else {
                        Get.defaultDialog(
                          title: 'Something Wrong',
                          middleText: 'Please fill all the form',
                        );
                      }
                    },
                    child: const Text(
                      'Add Employee',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

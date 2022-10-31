import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_employee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 30,
        ),
        child: Form(
          key: controller.employeeFormKey,
          child: Column(
            children: [
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
              Obx(
                () {
                  return controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            if (controller.employeeFormKey.currentState!
                                .validate()) {
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
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
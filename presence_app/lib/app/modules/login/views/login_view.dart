import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.ADD_EMPLOYEE);
            },
            icon: const Icon(Icons.login),
          )
        ],
        title: const Text('Login Page'),
        centerTitle: true,
      ),
      body: Form(
        key: controller.loginFormKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? 'Please enter Email' : null,
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) =>
                  value!.isEmpty ? 'Please enter Passsword' : null,
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.loginFormKey.currentState!.validate()) {
                  controller.login(
                    controller.emailController.text,
                    controller.passwordController.text,
                  );
                }
              },
              child: const Text(
                'Login',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

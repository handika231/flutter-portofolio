import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/login/controllers/login_controller.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());
  final authController = Get.find<LoginController>();
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
            icon: const Icon(
              Icons.person,
            ),
          )
        ],
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.value.toString(),
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

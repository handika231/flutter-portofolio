import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/data/db/pref_helper.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              PrefHelper.setLogin(false);
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: const Icon(Icons.add_box_sharp),
          ),
          IconButton(
            onPressed: () async {
              Get.toNamed(Routes.ADD_EMPLOYEE);
            },
            icon: const Icon(Icons.add),
          ),
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

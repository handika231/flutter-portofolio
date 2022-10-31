import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: const Icon(Icons.add_box_sharp),
          )
        ],
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}

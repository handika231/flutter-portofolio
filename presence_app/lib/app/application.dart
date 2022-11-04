import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/application_controller.dart';
import 'package:presence_app/injector.dart' as di;

import '../modules/login/views/login_view.dart';
import '../modules/main/views/main_view.dart';
import '../routes/app_pages.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final controller = Get.put(di.locator<ApplicationController>());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Presence App',
      getPages: AppPages.routes,
      home: controller.isLogin.value ? MainView() : const LoginView(),
    );
  }
}

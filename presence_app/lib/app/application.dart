import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/data/db/pref_helper.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';
import 'package:presence_app/app/modules/login/views/login_view.dart';
import 'package:presence_app/app/routes/app_pages.dart';

import 'modules/login/controllers/login_controller.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isLogin = false;

  Future checkLogin() async {
    isLogin = await PrefHelper.isLogin;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Presence App',
      home: isLogin ? const HomeView() : const LoginView(),
      getPages: AppPages.routes,
    );
  }
}

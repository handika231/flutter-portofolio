import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';
import 'package:presence_app/app/modules/login/controllers/login_controller.dart';
import 'package:presence_app/app/modules/login/views/login_view.dart';
import 'package:presence_app/app/routes/app_pages.dart';

class Application extends StatelessWidget {
  Application({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.auth.authStateChanges(),
      builder: (context, snapshot) {
        print(snapshot.data);
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Presence App',
          home: snapshot.data == null ? const LoginView() : const HomeView(),
          getPages: AppPages.routes,
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/application_controller.dart';
import 'package:presence_app/common/style.dart';
import 'package:presence_app/injector.dart' as di;
import 'package:presence_app/routes/navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../modules/login/views/login_view.dart';
import '../modules/main/views/main_view.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final controller = Get.put(di.locator<ApplicationController>());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: blueColor,
        ),
      ),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        );
      },
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Presence App',
      home: controller.isLogin.value ? MainView() : LoginView(),
    );
  }
}

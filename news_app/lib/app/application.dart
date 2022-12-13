import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/routes/app_routes.dart';
import 'package:news_app/routes/name_routes.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Beritakan',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: AppRoutes.pages,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/home_view.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

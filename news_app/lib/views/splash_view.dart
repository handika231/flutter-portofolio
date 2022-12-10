import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:news_app/style/app_style.dart';

import '../routes/name_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final int _time = Random().nextInt(5) + 1;
  void timer() {
    Future.delayed(Duration(seconds: _time), () {
      Get.offNamed(Routes.home);
    });
  }

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/splash.png',
              width: Get.width,
              height: 250,
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SpinKitFadingCircle(
              color: AppStyle.primaryColor,
              size: 50.0,
            ),
          )
        ],
      ),
    );
  }
}

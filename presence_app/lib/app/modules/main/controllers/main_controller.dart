import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presence_app/app/modules/home/views/home_view.dart';
import 'package:presence_app/app/modules/presence/views/presence_view.dart';
import 'package:presence_app/app/modules/profile/views/profile_view.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  List<Widget> pages = [
    HomeView(),
    PresenceView(),
    ProfileView(),
  ];
}

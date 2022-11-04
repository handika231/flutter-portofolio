import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../presence/views/presence_view.dart';
import '../../profile/views/profile_view.dart';

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

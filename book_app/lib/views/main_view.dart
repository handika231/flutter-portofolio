import 'package:book_app/common/app_style.dart';
import 'package:book_app/common/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../controller/main_notifier.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<MainNotifier>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.whiteColor,
        title: const Text(
          'Hello Kawan',
          style: TextStyle(
            fontWeight: AppStyle.bold,
            color: AppStyle.blackColor,
          ),
        ),
        leading: Image.asset(
          'register'.toPNG,
          height: 50,
        ),
      ),
      body: Consumer<MainNotifier>(
        builder: (context, value, child) {
          return value.views[value.currentIndex];
        },
      ),
      bottomNavigationBar: Consumer<MainNotifier>(
        builder: (context, value, child) => NavigationBar(
          height: 55.h,
          animationDuration: const Duration(milliseconds: 250),
          destinations: value.destination,
          selectedIndex: value.currentIndex,
          onDestinationSelected: value.changeIndex,
        ),
      ),
    );
  }
}

import 'package:get/get.dart';
import 'package:news_app/controller/home/home_bindings.dart';
import 'package:news_app/views/home_view.dart';

import 'name_routes.dart';

class AppRoutes {
  AppRoutes._();
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}

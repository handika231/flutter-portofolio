import 'package:get/get.dart';
import 'package:news_app/controller/detail/detail_bindings.dart';
import 'package:news_app/controller/home/home_bindings.dart';
import 'package:news_app/views/category_detail.dart';
import 'package:news_app/views/detail_view.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/splash_view.dart';

import '../controller/category/category_binding.dart';
import 'name_routes.dart';

class AppRoutes {
  AppRoutes._();
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.category,
      page: () => const CategoryDetail(),
      binding: CategoryBinding(),
    ),
  ];
}

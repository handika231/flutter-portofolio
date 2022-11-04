import 'package:get/get.dart';

import '../modules/add_employee/views/add_employee_view.dart';
import '../modules/all_presence/views/all_presence_view.dart';
import '../modules/detail_presence/views/detail_presence_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/views/main_view.dart';
import '../modules/presence/views/presence_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/update_profile/views/update_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.ADD_EMPLOYEE,
      page: () => AddEmployeeView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: _Paths.UPDATE_PROFILE,
      page: () => UpdateProfileView(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRESENCE,
      page: () => const DetailPresenceView(),
    ),
    GetPage(
      name: _Paths.ALL_PRESENCE,
      page: () => const AllPresenceView(),
    ),
    GetPage(
      name: _Paths.PRESENCE,
      page: () => PresenceView(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => di.locator<HomeController>(),
    );
  }
}

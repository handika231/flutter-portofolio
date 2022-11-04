import 'package:get/get.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => di.locator<LoginController>(),
    );
  }
}

import 'package:get/get.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => di.locator<ProfileController>(),
    );
  }
}

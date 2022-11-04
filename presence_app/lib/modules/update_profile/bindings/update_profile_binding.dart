import 'package:get/get.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/update_profile_controller.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(
      () => di.locator<UpdateProfileController>(),
    );
  }
}

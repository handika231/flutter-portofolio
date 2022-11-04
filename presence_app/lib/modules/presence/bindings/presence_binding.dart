import 'package:get/get.dart';
import 'package:presence_app/injector.dart' as di;

import '../controllers/presence_controller.dart';

class PresenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresenceController>(
      () => di.locator<PresenceController>(),
    );
  }
}

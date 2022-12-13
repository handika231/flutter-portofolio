import 'package:get/get.dart';
import 'package:news_app/controller/category/category_controller.dart';

class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}

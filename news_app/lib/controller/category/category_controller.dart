import 'package:get/get.dart';
import 'package:news_app/model/category_by_slug_model.dart';
import 'package:news_app/services/api_service.dart';

class CategoryController extends GetxController {
  ApiService service = ApiService();
  Future<CategoryBySlugModel> fetchCategoryBySlug(String slug) async {
    try {
      final data = await service.fetchCategoryBySlug(slug);
      return data;
    } catch (err) {
      throw Exception(err);
    }
  }
}

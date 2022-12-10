import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/routes/name_routes.dart';
import 'package:news_app/services/api_service.dart';

class DetailController extends GetxController {
  ApiService service = ApiService();

  TextEditingController commentController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> postComment(String slug) async {
    try {
      await service.addComment(
        comment: commentController.text,
        name: nameController.text,
        email: emailController.text,
        slug: slug,
      );
      Get.snackbar(
        'Success',
        'Komentar sudah berhasil ditambahkan, lakukan refresh untuk melihat komentar',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (err) {
      Get.snackbar(
        'Error',
        err.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      commentController.clear();
      nameController.clear();
      emailController.clear();
      Get.offNamedUntil(Routes.home, (route) => false);
    }
  }

  Future<NewsModel> fetchNewsBySlug(String slug) async {
    try {
      final data = await service.fetchNewsBySlug(slug);
      return data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
  }
}

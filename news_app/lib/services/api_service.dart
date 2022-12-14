import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/category_by_slug_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/news_model.dart';

class ApiService {
  Future<List<NewsModel>> fetchAllNews() async {
    Uri url = Uri.parse('https://api-news.androidcorners.com/api/web/posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data']['data'];
      return data.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<NewsModel> fetchNewsBySlug(String slug) async {
    Uri url =
        Uri.parse('https://sidesa.androidcorners.com/api/web/posts/$slug');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return NewsModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<void> addComment(
      {String slug = '',
      String comment = '',
      String name = '',
      String email = ''}) async {
    Uri url = Uri.parse(
        'https://api-news.androidcorners.com/api/web/posts/storeComment');
    await http.post(
      url,
      body: json.encode({
        'comment': comment,
        'name': name,
        'email': email,
        'slug': slug,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }

  Future<List<CategoryModel>> fetchAllCategory() async {
    Uri url =
        Uri.parse('https://api-news.androidcorners.com/api/web/categories');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body)['data']['data'];
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal untuk memuat kategori');
    }
  }

  Future<CategoryBySlugModel> fetchCategoryBySlug(String slug) async {
    Uri url = Uri.parse(
        'https://api-news.androidcorners.com/api/web/categories/$slug');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      return CategoryBySlugModel.fromJson(data);
    } else {
      throw Exception('Gagal untuk memuat kategori');
    }
  }
}

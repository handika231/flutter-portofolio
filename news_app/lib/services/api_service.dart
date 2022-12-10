import 'dart:convert';

import 'package:http/http.dart' as http;
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
}

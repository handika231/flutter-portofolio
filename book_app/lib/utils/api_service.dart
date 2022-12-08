import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/ebook_model/ebook_model.dart';

@singleton
class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<List<EbookModel>> fetchEbooks() async {
    final response =
        await _dio.get('http://192.168.100.7/ebookapp/api.php?latest');
    final List data = response.data;
    return data.map((e) => EbookModel.fromJson(e)).toList();
  }
}

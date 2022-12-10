import 'package:book_app/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../model/ebook_model/ebook_model.dart';

@singleton
class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<Either<Failure, List<EbookModel>>> fetchSlider() async {
    try {
      final response =
          await _dio.get('http://192.168.100.7/ebookapp/api.php?slider');
      final List data = response.data;
      return Right(data.map((e) => EbookModel.fromJson(e)).toList());
    } catch (e) {
      return Left(ServerFailure('Gagal mengambil data'));
    }
  }

  Future<Either<Failure, List<EbookModel>>> fetchLatest() async {
    try {
      final response =
          await _dio.get('http://192.168.100.7/ebookapp/api.php?latest');
      final List data = response.data;
      return Right(data.map((e) => EbookModel.fromJson(e)).toList());
    } catch (e) {
      return Left(ServerFailure('Gagal mengambil data'));
    }
  }
}

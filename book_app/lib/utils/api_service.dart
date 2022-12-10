import 'package:book_app/model/category_model/category_model.dart';
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

  Future<Either<Failure, List<EbookModel>>> fetchComing() async {
    try {
      final response =
          await _dio.get('http://192.168.100.7/ebookapp/api.php?coming');
      final List data = response.data;
      return Right(data.map((e) => EbookModel.fromJson(e)).toList());
    } catch (e) {
      return Left(ServerFailure('Gagal mengambil data'));
    }
  }

  Future<Either<Failure, List<CategoryModel>>> fetchCategory() async {
    try {
      final response =
          await _dio.get('http://192.168.100.7/ebookapp/api.php?category');
      final List data = response.data;
      return Right(data.map((e) => CategoryModel.fromJson(e)).toList());
    } catch (e) {
      return Left(ServerFailure('Gagal mengambil data'));
    }
  }
}

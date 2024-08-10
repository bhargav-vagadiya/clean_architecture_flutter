import 'package:clean_arch_flutter/src/features/home/data/models/photo_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class RemoteDataSource {
  Future<List<PhotoModel>> getPhotos();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio dio;

  RemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PhotoModel>> getPhotos() async {
    try {
      final response = await dio.get<List<Map<String, dynamic>>>(
          "https://jsonplaceholder.typicode.com/photos");
      return compute(parseJson, response.data!);
    } on DioException {
      rethrow;
    }
  }

  static List<PhotoModel> parseJson(List<Map<String, dynamic>> json) {
    return json.map((e) => PhotoModel.fromJson(e)).toList();
  }
}

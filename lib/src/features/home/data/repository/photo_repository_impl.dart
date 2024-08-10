import 'package:clean_arch_flutter/src/features/home/data/data_source/remote_data_source.dart';
import 'package:clean_arch_flutter/src/features/home/data/models/photo_model.dart';
import 'package:clean_arch_flutter/src/features/home/domain/entity/photo_entity.dart';
import 'package:clean_arch_flutter/src/features/home/domain/repository/photo_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final RemoteDataSourceImpl remoteDataSourceImpl;

  PhotoRepositoryImpl({required this.remoteDataSourceImpl});

  @override
  Future<Either<Fail<String>, List<PhotoEntity>>> getPhotos() async {
    try {
      List<PhotoModel> photoModel = await remoteDataSourceImpl.getPhotos();
      return Right(photoModel);
    } on DioException catch (e) {
      return Left(Fail(e.message!));
    }
  }
}

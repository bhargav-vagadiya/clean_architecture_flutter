import 'package:clean_arch_flutter/src/features/home/domain/entity/photo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PhotoRepository {
  Future<Either<Fail<String>, List<PhotoEntity>>> getPhotos();
}

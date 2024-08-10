import 'package:clean_arch_flutter/src/features/home/domain/entity/photo_entity.dart';
import 'package:clean_arch_flutter/src/features/home/domain/repository/photo_repository.dart';
import 'package:dartz/dartz.dart';

class GetPhotos {
  final PhotoRepository photoRepository;

  GetPhotos({required this.photoRepository});

  Future<Either<Fail<String>, List<PhotoEntity>>> call() async {
    return await photoRepository.getPhotos();
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_flutter/src/features/home/data/data_source/remote_data_source.dart';
import 'package:clean_arch_flutter/src/features/home/data/repository/photo_repository_impl.dart';
import 'package:clean_arch_flutter/src/features/home/domain/entity/photo_entity.dart';
import 'package:clean_arch_flutter/src/features/home/domain/use_cases/get_photos.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotoLoading()) {
    on<PhotoInit>(_onPhotoInit);
  }

  FutureOr<void> _onPhotoInit(
      PhotoInit event, Emitter<PhotosState> emit) async {
    emit(PhotoLoading());
    PhotoRepositoryImpl photoRepositoryImpl = PhotoRepositoryImpl(
        remoteDataSourceImpl: RemoteDataSourceImpl(dio: Dio()));
    var result = await GetPhotos(photoRepository: photoRepositoryImpl).call();
    result.fold(
      (l) => emit(PhotoErrorState(error: l.failure.toString())),
      (r) => emit(PhotoSuccessState(photos: r)),
    );
  }
}

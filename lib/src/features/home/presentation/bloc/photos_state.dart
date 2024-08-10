part of 'photos_bloc.dart';

abstract class PhotosState {}

class PhotoLoading extends PhotosState {}

class PhotoErrorState extends PhotosState {
  final String error;

  PhotoErrorState({required this.error});
}

class PhotoSuccessState extends PhotosState {
  final List<PhotoEntity> photos;

  PhotoSuccessState({required this.photos});
}

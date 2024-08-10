import 'package:clean_arch_flutter/src/features/home/domain/entity/photo_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends PhotoEntity {
  PhotoModel({
    super.albumId,
    super.id,
    super.title,
    super.url,
    super.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_image_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditImageCarParams _$EditImageCarParamsFromJson(Map<String, dynamic> json) =>
    EditImageCarParams(
      carId: json['car_id'] as int?,
      image: _$JsonConverterFromJson<String, File>(
          json['image'], const FileJsonConverter().fromJson),
      imageId: json['image_id'] as int?,
    );

Map<String, dynamic> _$EditImageCarParamsToJson(EditImageCarParams instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'image': _$JsonConverterToJson<String, File>(
          instance.image, const FileJsonConverter().toJson),
      'image_id': instance.imageId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

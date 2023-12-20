// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentParams _$CommentParamsFromJson(Map<String, dynamic> json) =>
    CommentParams(
      carId: json['car_id'] as int?,
      plateId: json['plate_id'] as int?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$CommentParamsToJson(CommentParams instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'plate_id': instance.plateId,
      'page': instance.page,
    };

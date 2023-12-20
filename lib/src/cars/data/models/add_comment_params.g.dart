// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_comment_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCommentParams _$AddCommentParamsFromJson(Map<String, dynamic> json) =>
    AddCommentParams(
      carId: json['car_id'] as int?,
      plateId: json['plate_id'] as int?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$AddCommentParamsToJson(AddCommentParams instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'plate_id': instance.plateId,
      'body': instance.body,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_plate_date_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePlateDateParams _$UpdatePlateDateParamsFromJson(
        Map<String, dynamic> json) =>
    UpdatePlateDateParams(
      modelId: json['model_id'] as int?,
      modelRole: json['model_role'] as String?,
      plateId: json['plate_id'] as int?,
    );

Map<String, dynamic> _$UpdatePlateDateParamsToJson(
        UpdatePlateDateParams instance) =>
    <String, dynamic>{
      'model_id': instance.modelId,
      'model_role': instance.modelRole,
      'plate_id': instance.plateId,
    };

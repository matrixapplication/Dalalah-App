// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_car_date_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCarDateParams _$UpdateCarDateParamsFromJson(Map<String, dynamic> json) =>
    UpdateCarDateParams(
      modelId: json['model_id'] as int?,
      modelRole: json['model_role'] as String?,
      carId: json['car_id'] as int?,
    );

Map<String, dynamic> _$UpdateCarDateParamsToJson(
        UpdateCarDateParams instance) =>
    <String, dynamic>{
      'model_id': instance.modelId,
      'model_role': instance.modelRole,
      'car_id': instance.carId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_car_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminCarParams _$AdminCarParamsFromJson(Map<String, dynamic> json) =>
    AdminCarParams(
      brandId: json['brand_id'] as int?,
      carModelId: json['car_model_id'] as int?,
      carModelExtensionId: json['car_model_extension_id'] as int?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$AdminCarParamsToJson(AdminCarParams instance) =>
    <String, dynamic>{
      'brand_id': instance.brandId,
      'car_model_id': instance.carModelId,
      'car_model_extension_id': instance.carModelExtensionId,
      'year': instance.year,
    };

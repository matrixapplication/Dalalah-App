// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandModelDto _$BrandModelDtoFromJson(Map<String, dynamic> json) =>
    BrandModelDto(
      id: json['id'] as int?,
      brand: json['brand'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BrandModelDtoToJson(BrandModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
    };

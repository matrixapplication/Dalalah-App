// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageDto _$PackageDtoFromJson(Map<String, dynamic> json) => PackageDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      period: json['period'] as String?,
      price: json['price'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$PackageDtoToJson(PackageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'period': instance.period,
      'price': instance.price,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

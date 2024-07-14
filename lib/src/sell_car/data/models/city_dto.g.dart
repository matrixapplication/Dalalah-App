// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDto _$CityDtoFromJson(Map<String, dynamic> json) => CityDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cityPayment: json['city_payment'] as String?,
    );

Map<String, dynamic> _$CityDtoToJson(CityDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city_payment': instance.cityPayment,
    };

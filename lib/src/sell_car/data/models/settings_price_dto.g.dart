// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsPriceDto _$SettingsPriceDtoFromJson(Map<String, dynamic> json) =>
    SettingsPriceDto(
      carMaxPrice: json['car_max_price'] as int?,
      carMinPrice: json['car_min_price'] as int?,
    );

Map<String, dynamic> _$SettingsPriceDtoToJson(SettingsPriceDto instance) =>
    <String, dynamic>{
      'car_max_price': instance.carMaxPrice,
      'car_min_price': instance.carMinPrice,
    };

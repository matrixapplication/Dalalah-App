// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_plate_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPlateParams _$AddPlateParamsFromJson(Map<String, dynamic> json) =>
    AddPlateParams(
      userId: json['user_id'] as int?,
      cityId: json['city_id'] as int?,
      districtId: json['district_id'] as int?,
      letterAr: json['letter_ar'] as String?,
      letterEn: json['letter_en'] as String?,
      plateNumber: json['plate_number'] as String?,
      price: json['price'] as int?,
      plateType: json['plate_type'] as String?,
      adType: json['ad_type'] as String?,
    );

Map<String, dynamic> _$AddPlateParamsToJson(AddPlateParams instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'letter_ar': instance.letterAr,
      'letter_en': instance.letterEn,
      'plate_number': instance.plateNumber,
      'price': instance.price,
      'plate_type': instance.plateType,
      'ad_type': instance.adType,
    };

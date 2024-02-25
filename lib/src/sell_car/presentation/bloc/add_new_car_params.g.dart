// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_car_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNewCarParams _$AddNewCarParamsFromJson(Map<String, dynamic> json) =>
    AddNewCarParams(
      carId: json['car_id'] as int?,
      price: json['price'] as int?,
      description: json['description'] as String?,
      monthlyInstallment: json['monthly_installment'] as int?,
      adType: json['ad_type'] as String?,
    );

Map<String, dynamic> _$AddNewCarParamsToJson(AddNewCarParams instance) =>
    <String, dynamic>{
      'car_id': instance.carId,
      'price': instance.price,
      'description': instance.description,
      'monthly_installment': instance.monthlyInstallment,
      'ad_type': instance.adType,
    };

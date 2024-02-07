// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsDto _$ContactUsDtoFromJson(Map<String, dynamic> json) => ContactUsDto(
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ContactUsDtoToJson(ContactUsDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
    };

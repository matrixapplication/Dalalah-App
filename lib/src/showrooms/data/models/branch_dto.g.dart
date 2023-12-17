// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchDto _$BranchDtoFromJson(Map<String, dynamic> json) => BranchDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      cityId: json['cityId'] as int?,
      districtId: json['districtId'] as int?,
      link: json['link'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$BranchDtoToJson(BranchDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'district': instance.district,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'cityId': instance.cityId,
      'districtId': instance.districtId,
      'link': instance.link,
      'address': instance.address,
    };

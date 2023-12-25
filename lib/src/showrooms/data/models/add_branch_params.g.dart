// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_branch_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBranchParams _$AddBranchParamsFromJson(Map<String, dynamic> json) =>
    AddBranchParams(
      nameEn: json['name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      addressEn: json['address_en'] as String?,
      addressAr: json['address_ar'] as String?,
      cityId: json['city_id'] as int?,
      districtId: json['district_id'] as int?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddBranchParamsToJson(AddBranchParams instance) =>
    <String, dynamic>{
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'address_en': instance.addressEn,
      'address_ar': instance.addressAr,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'link': instance.link,
      'id': instance.id,
    };

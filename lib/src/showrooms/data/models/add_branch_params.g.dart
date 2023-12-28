// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_branch_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBranchParams _$AddBranchParamsFromJson(Map<String, dynamic> json) =>
    AddBranchParams(
      name: json['name'] == null
          ? null
          : AddBranchName.fromJson(json['name'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : AddBranchAddress.fromJson(json['address'] as Map<String, dynamic>),
      cityId: json['city_id'] as int?,
      districtId: json['district_id'] as int?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      link: json['link'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddBranchParamsToJson(AddBranchParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'link': instance.link,
      'id': instance.id,
    };

AddBranchName _$AddBranchNameFromJson(Map<String, dynamic> json) =>
    AddBranchName(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$AddBranchNameToJson(AddBranchName instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

AddBranchAddress _$AddBranchAddressFromJson(Map<String, dynamic> json) =>
    AddBranchAddress(
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );

Map<String, dynamic> _$AddBranchAddressToJson(AddBranchAddress instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ar': instance.ar,
    };

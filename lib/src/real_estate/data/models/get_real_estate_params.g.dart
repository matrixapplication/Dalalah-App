// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_real_estate_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRealEstateParams _$GetRealEstateParamsFromJson(Map<String, dynamic> json) =>
    GetRealEstateParams(
      type: json['type'] as String?,
      categoryId: json['category_id'] as int?,
    );

Map<String, dynamic> _$GetRealEstateParamsToJson(
        GetRealEstateParams instance) =>
    <String, dynamic>{
      'type': instance.type,
      'category_id': instance.categoryId,
    };

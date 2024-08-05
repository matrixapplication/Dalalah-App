// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealEstateParams _$RealEstateParamsFromJson(Map<String, dynamic> json) =>
    RealEstateParams(
      limit: json['limit'] as int?,
      type: json['type'] as String?,
      sortOrder: json['order'] as String?,
      propStatus: json['prop_status'] as String?,
      status: json['status'] as String?,
      categoryId: json['category_id'] as int?,
      priceFrom: json['price_from'] as String?,
      priceTo: json['price_to'] as String?,
      cityId: json['city_id'] as int?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      detailsIds: (json['details_ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      detailsValues: (json['details_vals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RealEstateParamsToJson(RealEstateParams instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'type': instance.type,
      'order': instance.sortOrder,
      'prop_status': instance.propStatus,
      'status': instance.status,
      'category_id': instance.categoryId,
      'price_from': instance.priceFrom,
      'price_to': instance.priceTo,
      'city_id': instance.cityId,
      'features': instance.features,
      'details_ids': instance.detailsIds,
      'details_vals': instance.detailsValues,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_real_estate_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRealEstateParams _$AddRealEstateParamsFromJson(Map<String, dynamic> json) =>
    AddRealEstateParams(
      title: json['title'] as String?,
      type: json['type'] as String?,
      status: json['prop_status'] as String?,
      categoryId: json['category_id'] as int?,
      price: json['price'],
      description: json['description'] as String?,
      cityId: json['city_id'] as int?,
      streetName: json['street_name'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      cover: _$JsonConverterFromJson<String, File>(
          json['cover'], const FileJsonConverter().fromJson),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => const FileJsonConverter().fromJson(e as String))
          .toList(),
      features:
          (json['features'] as List<dynamic>?)?.map((e) => e as int).toList(),
      detailsList: (json['details[]'] as List<dynamic>?)
          ?.map((e) => DetailsItemModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddRealEstateParamsToJson(
        AddRealEstateParams instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'prop_status': instance.status,
      'category_id': instance.categoryId,
      'price': instance.price,
      'description': instance.description,
      'city_id': instance.cityId,
      'street_name': instance.streetName,
      'lat': instance.lat,
      'lng': instance.lng,
      'cover': _$JsonConverterToJson<String, File>(
          instance.cover, const FileJsonConverter().toJson),
      'images': instance.images?.map(const FileJsonConverter().toJson).toList(),
      'features': instance.features,
      'details[]': instance.detailsList,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

DetailsItemModelDto _$DetailsItemModelDtoFromJson(Map<String, dynamic> json) =>
    DetailsItemModelDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$DetailsItemModelDtoToJson(
        DetailsItemModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

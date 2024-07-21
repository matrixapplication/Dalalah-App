// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealEstateCategoryDetailsDto _$RealEstateCategoryDetailsDtoFromJson(
        Map<String, dynamic> json) =>
    RealEstateCategoryDetailsDto(
      details: (json['details'] as List<dynamic>?)
          ?.map((e) => DetailsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeaturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RealEstateCategoryDetailsDtoToJson(
        RealEstateCategoryDetailsDto instance) =>
    <String, dynamic>{
      'details': instance.details,
      'features': instance.features,
    };

DetailsDto _$DetailsDtoFromJson(Map<String, dynamic> json) => DetailsDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      unit: json['unit'] as String?,
      type: json['type'] as String?,
      min: json['min'],
      max: json['max'],
      icon: json['icon'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsDtoToJson(DetailsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'type': instance.type,
      'min': instance.min,
      'max': instance.max,
      'icon': instance.icon,
      'options': instance.options,
    };

OptionsDto _$OptionsDtoFromJson(Map<String, dynamic> json) => OptionsDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$OptionsDtoToJson(OptionsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

FeaturesDto _$FeaturesDtoFromJson(Map<String, dynamic> json) => FeaturesDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$FeaturesDtoToJson(FeaturesDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

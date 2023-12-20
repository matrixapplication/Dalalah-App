// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureDto _$FeatureDtoFromJson(Map<String, dynamic> json) => FeatureDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => OptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeatureDtoToJson(FeatureDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'options': instance.options,
    };

OptionDto _$OptionDtoFromJson(Map<String, dynamic> json) => OptionDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$OptionDtoToJson(OptionDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };

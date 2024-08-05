// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'real_estate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealEstatesModel _$RealEstatesModelFromJson(Map<String, dynamic> json) =>
    RealEstatesModel(
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RealEstatesModelToJson(RealEstatesModel instance) =>
    <String, dynamic>{
      'properties': instance.properties,
    };

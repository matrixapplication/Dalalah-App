// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarDetailsDto _$CarDetailsDtoFromJson(Map<String, dynamic> json) =>
    CarDetailsDto(
      sameCars: (json['same_cars'] as List<dynamic>?)
          ?.map((e) => SameCarDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      relatedCars: (json['related_cars'] as List<dynamic>?)
          ?.map((e) => CarDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      carDetails: json['car'] == null
          ? null
          : CarDto.fromJson(json['car'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarDetailsDtoToJson(CarDetailsDto instance) =>
    <String, dynamic>{
      'car': instance.carDetails,
      'same_cars': instance.sameCars,
      'related_cars': instance.relatedCars,
    };

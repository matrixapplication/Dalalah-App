// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestPriceDto _$RequestPriceDtoFromJson(Map<String, dynamic> json) =>
    RequestPriceDto(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      showroom: json['showroom'] == null
          ? null
          : ShowroomDto.fromJson(json['showroom'] as Map<String, dynamic>),
      car: json['car'] == null
          ? null
          : CarDto.fromJson(json['car'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RequestPriceDtoToJson(RequestPriceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'user': instance.user,
      'showroom': instance.showroom,
      'car': instance.car,
    };

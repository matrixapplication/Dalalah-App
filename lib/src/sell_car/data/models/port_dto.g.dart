// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'port_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortDto _$PortDtoFromJson(Map<String, dynamic> json) => PortDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$PortDtoToJson(PortDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

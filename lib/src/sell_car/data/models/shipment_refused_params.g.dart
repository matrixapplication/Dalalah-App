// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_refused_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentRefusedParams _$ShipmentRefusedParamsFromJson(
        Map<String, dynamic> json) =>
    ShipmentRefusedParams(
      type: json['type'] as String?,
      price: json['price'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ShipmentRefusedParamsToJson(
        ShipmentRefusedParams instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
      'comment': instance.comment,
    };

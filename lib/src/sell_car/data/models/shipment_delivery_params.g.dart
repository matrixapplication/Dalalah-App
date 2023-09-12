// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_delivery_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentDeliveryParams _$ShipmentDeliveryParamsFromJson(
        Map<String, dynamic> json) =>
    ShipmentDeliveryParams(
      type: json['type'] as String?,
      price: json['price'] as int?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ShipmentDeliveryParamsToJson(
        ShipmentDeliveryParams instance) =>
    <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
      'comment': instance.comment,
    };

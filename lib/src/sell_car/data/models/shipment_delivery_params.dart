import 'package:json_annotation/json_annotation.dart'; 

part 'shipment_delivery_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ShipmentDeliveryParams {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'comment')
  String? comment;

  ShipmentDeliveryParams({this.type, this.price, this.comment});

   factory ShipmentDeliveryParams.fromJson(Map<String, dynamic> json) => _$ShipmentDeliveryParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ShipmentDeliveryParamsToJson(this);
}


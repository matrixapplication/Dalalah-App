import 'package:json_annotation/json_annotation.dart'; 

part 'shipment_refused_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ShipmentRefusedParams {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'comment')
  String? comment;

  ShipmentRefusedParams({this.type, this.price, this.comment});

   factory ShipmentRefusedParams.fromJson(Map<String, dynamic> json) => _$ShipmentRefusedParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ShipmentRefusedParamsToJson(this);
}


import 'package:json_annotation/json_annotation.dart'; 

part 'delay_shipment_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class DelayShipmentParams {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'reason')
  String? reason;

  DelayShipmentParams({this.id, this.reason});

   factory DelayShipmentParams.fromJson(Map<String, dynamic> json) => _$DelayShipmentParamsFromJson(json);

   Map<String, dynamic> toJson() => _$DelayShipmentParamsToJson(this);
}


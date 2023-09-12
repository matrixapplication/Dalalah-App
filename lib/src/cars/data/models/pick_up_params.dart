import 'package:json_annotation/json_annotation.dart'; 

part 'pick_up_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class PickUpParams {
  @JsonKey(name: 'expectedNumberShipments')
  int? expectedNumberShipments;
  @JsonKey(name: 'actualNumberShipment')
  int? actualNumberShipment;

  PickUpParams({this.expectedNumberShipments, this.actualNumberShipment});

   factory PickUpParams.fromJson(Map<String, dynamic> json) => _$PickUpParamsFromJson(json);

   Map<String, dynamic> toJson() => _$PickUpParamsToJson(this);
}


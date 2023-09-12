import 'package:json_annotation/json_annotation.dart'; 

part 'notes_on_shipment_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NotesOnShipmentParams {
  @JsonKey(name: 'comment')
  String? comment;

  NotesOnShipmentParams({this.comment});

   factory NotesOnShipmentParams.fromJson(Map<String, dynamic> json) => _$NotesOnShipmentParamsFromJson(json);

   Map<String, dynamic> toJson() => _$NotesOnShipmentParamsToJson(this);
}


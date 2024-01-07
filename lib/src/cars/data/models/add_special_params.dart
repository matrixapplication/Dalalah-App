import 'package:json_annotation/json_annotation.dart'; 

part 'add_special_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AdSpecialParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'ad_type')
  String? type;

  AdSpecialParams({this.id, this.type});

   factory AdSpecialParams.fromJson(Map<String, dynamic> json) => _$AdSpecialParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AdSpecialParamsToJson(this);
}


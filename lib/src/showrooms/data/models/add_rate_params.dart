import 'package:json_annotation/json_annotation.dart'; 

part 'add_rate_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddRateParams {
  @JsonKey(name: 'showroom_id')
  int? showroomId;
  @JsonKey(name: 'rate')
  int? rate;

  AddRateParams({this.showroomId, this.rate});

   factory AddRateParams.fromJson(Map<String, dynamic> json) => _$AddRateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddRateParamsToJson(this);
}


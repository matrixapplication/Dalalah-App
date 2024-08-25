import 'package:json_annotation/json_annotation.dart'; 

part 'add_rate_developer_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddRateDeveloperParams {
  @JsonKey(name: 'prop_developer_id')
  int? propDeveloperId;
  @JsonKey(name: 'rate')
  int? rate;

  AddRateDeveloperParams({this.propDeveloperId, this.rate});

   factory AddRateDeveloperParams.fromJson(Map<String, dynamic> json) => _$AddRateDeveloperParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddRateDeveloperParamsToJson(this);
}


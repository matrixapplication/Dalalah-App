import 'package:json_annotation/json_annotation.dart'; 

part 'update_plate_date_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UpdatePlateDateParams {
  @JsonKey(name: 'model_id')
  int? modelId;
  @JsonKey(name: 'model_role')
  String? modelRole;
  @JsonKey(name: 'plate_id')
  int? plateId;

  UpdatePlateDateParams({this.modelId, this.modelRole, this.plateId});

   factory UpdatePlateDateParams.fromJson(Map<String, dynamic> json) => _$UpdatePlateDateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$UpdatePlateDateParamsToJson(this);
}


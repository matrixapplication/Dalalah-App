import 'package:json_annotation/json_annotation.dart'; 

part 'update_car_date_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class UpdateCarDateParams {
  @JsonKey(name: 'model_id')
  int? modelId;
  @JsonKey(name: 'model_role')
  String? modelRole;
  @JsonKey(name: 'car_id')
  int? carId;

  UpdateCarDateParams({this.modelId, this.modelRole, this.carId});

   factory UpdateCarDateParams.fromJson(Map<String, dynamic> json) => _$UpdateCarDateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$UpdateCarDateParamsToJson(this);
}


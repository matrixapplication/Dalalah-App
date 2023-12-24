import 'package:json_annotation/json_annotation.dart'; 

part 'admin_car_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AdminCarParams {
  @JsonKey(name: 'brand_id')
  int? brandId;
  @JsonKey(name: 'car_model_id')
  int? carModelId;
  @JsonKey(name: 'car_model_extension_id')
  int? carModelExtensionId;
  @JsonKey(name: 'year')
  int? year;

  AdminCarParams({this.brandId, this.carModelId, this.carModelExtensionId, this.year});

   factory AdminCarParams.fromJson(Map<String, dynamic> json) => _$AdminCarParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AdminCarParamsToJson(this);
}


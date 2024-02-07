import 'package:json_annotation/json_annotation.dart'; 

part 'installment_cars_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class InstallmentCarsParams {
  @JsonKey(name: 'installment')
  int? installment;
  @JsonKey(name: 'page')
  int? page;

  InstallmentCarsParams({this.installment, this.page});

   factory InstallmentCarsParams.fromJson(Map<String, dynamic> json) => _$InstallmentCarsParamsFromJson(json);

   Map<String, dynamic> toJson() => _$InstallmentCarsParamsToJson(this);
}


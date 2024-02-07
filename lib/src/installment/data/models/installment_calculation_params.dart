import 'package:json_annotation/json_annotation.dart'; 

part 'installment_calculation_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class InstallmentCalculationParams {
  @JsonKey(name: 'gross_salary')
  int? grossSalary;
  @JsonKey(name: 'personal_finance')
  int? personalFinance;
  @JsonKey(name: 'mortgage')
  int? mortgage;
  @JsonKey(name: 'credit_card')
  int? creditCard;

  InstallmentCalculationParams({this.grossSalary, this.personalFinance, this.mortgage, this.creditCard});

   factory InstallmentCalculationParams.fromJson(Map<String, dynamic> json) => _$InstallmentCalculationParamsFromJson(json);

   Map<String, dynamic> toJson() => _$InstallmentCalculationParamsToJson(this);
}


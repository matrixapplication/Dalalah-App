// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'installment_calculation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InstallmentCalculationParams _$InstallmentCalculationParamsFromJson(
        Map<String, dynamic> json) =>
    InstallmentCalculationParams(
      grossSalary: json['gross_salary'] as int?,
      personalFinance: json['personal_finance'] as int?,
      mortgage: json['mortgage'] as int?,
      creditCard: json['credit_card'] as int?,
    );

Map<String, dynamic> _$InstallmentCalculationParamsToJson(
        InstallmentCalculationParams instance) =>
    <String, dynamic>{
      'gross_salary': instance.grossSalary,
      'personal_finance': instance.personalFinance,
      'mortgage': instance.mortgage,
      'credit_card': instance.creditCard,
    };

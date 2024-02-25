import 'package:dalalah/src/sell_car/data/models/sell_car_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_new_car_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddNewCarParams {
  @JsonKey(name: 'car_id')
  int? carId;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'monthly_installment')
  int? monthlyInstallment;
  @JsonKey(name: 'ad_type')
  String? adType;

  AddNewCarParams({this.carId, this.price, this.description, this.monthlyInstallment, this.adType});

   // factory AddNewCarParams.fromJson(Map<String, dynamic> json) => _$AddNewCarParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddNewCarParamsToJson(this);

  factory AddNewCarParams.fromParams(SellCarParams json) {
    return AddNewCarParams(
      carId: json.carId,
      price: json.price,
      description: json.description,
      monthlyInstallment: json.installment,
      adType: json.adType,
    );
  }
}


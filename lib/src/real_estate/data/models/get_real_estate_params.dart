import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import '../../../sell_car/data/models/sell_car_params.dart';

part 'get_real_estate_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class GetRealEstateParams {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'category_id')
  int? categoryId;


  GetRealEstateParams({this.type, this.categoryId});

  factory GetRealEstateParams.fromJson(Map<String, dynamic> json) => _$GetRealEstateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$GetRealEstateParamsToJson(this);
}




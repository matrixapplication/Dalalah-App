import 'package:json_annotation/json_annotation.dart'; 

part 'add_plate_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddPlateParams {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'district_id')
  int? districtId;
  @JsonKey(name: 'letter_ar')
  String? letterAr;
  @JsonKey(name: 'letter_en')
  String? letterEn;
  @JsonKey(name: 'plate_number')
  String? plateNumber;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'plate_type')
  String? plateType;
  @JsonKey(name: 'ad_type')
  String? adType;

  AddPlateParams({this.id, this.userId, this.cityId, this.districtId, this.letterAr, this.letterEn, this.plateNumber, this.price, this.plateType, this.adType});

   factory AddPlateParams.fromJson(Map<String, dynamic> json) => _$AddPlateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddPlateParamsToJson(this);
}


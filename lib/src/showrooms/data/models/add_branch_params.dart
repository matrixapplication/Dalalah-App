import 'package:json_annotation/json_annotation.dart'; 

part 'add_branch_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class AddBranchParams {
  @JsonKey(name: 'name_en')
  String? nameEn;
  @JsonKey(name: 'name_ar')
  String? nameAr;
  @JsonKey(name: 'address_en')
  String? addressEn;
  @JsonKey(name: 'address_ar')
  String? addressAr;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'district_id')
  int? districtId;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'link')
  String? link;

  // Not send in query but in path For edit
  @JsonKey(name: 'id')
  String? id;

  AddBranchParams({this.nameEn, this.nameAr, this.addressEn, this.addressAr, this.cityId, this.districtId, this.phone, this.whatsapp, this.link, this.id});

   factory AddBranchParams.fromJson(Map<String, dynamic> json) => _$AddBranchParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddBranchParamsToJson(this);
}


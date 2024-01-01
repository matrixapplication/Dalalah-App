import 'package:json_annotation/json_annotation.dart'; 

part 'add_branch_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AddBranchParams {
  @JsonKey(name: 'name')
  AddBranchName? name;
  @JsonKey(name: 'address')
  AddBranchAddress? address;
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

  // Note: This is not used in the Query Parameters, but it is used in the Path Parameters for edit branch
  @JsonKey(name: 'id')
  int? id;

  AddBranchParams({this.name, this.address, this.cityId, this.districtId, this.phone, this.whatsapp, this.link, this.id});

   factory AddBranchParams.fromJson(Map<String, dynamic> json) => _$AddBranchParamsFromJson(json);

   // remove id from toJson
    Map<String, dynamic> toJson() => _$AddBranchParamsToJson(this)
      ..remove('id');
}

@JsonSerializable(ignoreUnannotated: false)
class  AddBranchName {
  @JsonKey(name: 'en')
  String? en;
  @JsonKey(name: 'ar')
  String? ar;

  AddBranchName({this.en, this.ar});

   factory AddBranchName.fromJson(Map<String, dynamic> json) => _$AddBranchNameFromJson(json);

   Map<String, dynamic> toJson() => _$AddBranchNameToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class AddBranchAddress {
  @JsonKey(name: 'en')
  String? en;
  @JsonKey(name: 'ar')
  String? ar;

  AddBranchAddress({this.en, this.ar});

   factory AddBranchAddress.fromJson(Map<String, dynamic> json) => _$AddBranchAddressFromJson(json);

   Map<String, dynamic> toJson() => _$AddBranchAddressToJson(this);
}


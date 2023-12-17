import 'package:json_annotation/json_annotation.dart'; 

part 'branch_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class BranchDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'district')
  String? district;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'cityId')
  int? cityId;
  @JsonKey(name: 'districtId')
  int? districtId;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'address')
  String? address;

  BranchDto({this.id, this.name, this.city, this.district, this.phone, this.whatsapp, this.cityId, this.districtId, this.link, this.address});

   factory BranchDto.fromJson(Map<String, dynamic> json) => _$BranchDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BranchDtoToJson(this);
}


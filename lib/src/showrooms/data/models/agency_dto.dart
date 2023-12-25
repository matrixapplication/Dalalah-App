import 'package:json_annotation/json_annotation.dart'; 

part 'agency_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class AgencyDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'showroom_name')
  String? showroomName;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'end_tax_card')
  String? endTaxCard;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'count_cars')
  int? countCars;
  @JsonKey(name: 'avg_rate')
  String? avgRate;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'is_blocked')
  bool? isBlocked;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'cover_image')
  String? coverImage;

  AgencyDto({this.id, this.ownerName, this.showroomName, this.description, this.code, this.phone, this.whatsapp, this.endTaxCard, this.role, this.countCars, this.avgRate, this.address, this.isBlocked, this.image, this.coverImage});

   factory AgencyDto.fromJson(Map<String, dynamic> json) => _$AgencyDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AgencyDtoToJson(this);
}


import 'package:json_annotation/json_annotation.dart'; 

part 'showroom_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class ShowroomDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'name')
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
  @JsonKey(name: 'followers')
  int? followers;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'is_blocked')
  bool? isBlocked;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'cover_image')
  String? coverImage;
  @JsonKey(name: 'is_followed')
  bool? isFollowed;
  @JsonKey(name: 'avg_rate')
  String? avgRate;

  ShowroomDto({this.id, this.ownerName, this.showroomName, this.description, this.code, this.phone, this.whatsapp, this.followers, this.endTaxCard, this.role, this.countCars, this.address, this.isBlocked, this.image, this.coverImage, this.isFollowed, this.avgRate});

   factory ShowroomDto.fromJson(Map<String, dynamic> json) => _$ShowroomDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ShowroomDtoToJson(this);
}


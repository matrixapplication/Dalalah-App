import 'package:json_annotation/json_annotation.dart';

import '../../../sell_car/data/models/city_dto.dart';

part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ProfileDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'owner_name_ar')
  String? ownerNameAr;
  @JsonKey(name: 'owner_name_en')
  String? ownerNameEn;
  @JsonKey(name: 'name_ar')
  String? nameAr;
  @JsonKey(name: 'name_en')
  String? nameEn;
  @JsonKey(name: 'address_en')
  String? addressAr;
  @JsonKey(name: 'address_ar')
  String? addressEn;
  @JsonKey(name: 'description_en')
  String? descriptionEn;
  @JsonKey(name: 'description_ar')
  String? descriptionAr;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'code')
  dynamic code;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'another_phone_1')
  String? anotherPhone1;
  @JsonKey(name: 'another_phone_2')
  String? anotherPhone2;
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
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'is_blocked')
  bool? isBlocked;
  @JsonKey(name: 'is_hide')
  bool? isHide;
  @JsonKey(name: 'followers')
  int? followers;
  @JsonKey(name: 'is_followed')
  bool? isFollowed;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'cover_image')
  String? coverImage;
  @JsonKey(name: 'token')
  String? token;

  ProfileDto({this.id, this.name, this.ownerNameAr, this.ownerNameEn, this.nameAr, this.nameEn, this.descriptionEn, this.descriptionAr, this.email, this.code, this.phone, this.anotherPhone1, this.anotherPhone2, this.whatsapp, this.endTaxCard, this.role, this.countCars, this.avgRate, this.city, this.address, this.isBlocked, this.isHide, this.followers, this.isFollowed, this.image, this.coverImage, this.token});

   factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}


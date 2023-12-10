import 'package:json_annotation/json_annotation.dart';

import '../../../sell_car/data/models/city_dto.dart';

part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class ProfileDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'token')
  String? token;

  ProfileDto({this.id, this.name, this.email, this.phone, this.whatsapp, this.role, this.image, this.city, this.token});

   factory ProfileDto.fromJson(Map<String, dynamic> json) => _$ProfileDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoToJson(this);
}


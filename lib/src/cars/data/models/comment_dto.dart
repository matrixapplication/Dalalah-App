import 'package:json_annotation/json_annotation.dart';

import '../../../sell_car/data/models/city_dto.dart';

part 'comment_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CommentDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'body')
  String? body;
  @JsonKey(name: 'reported')
  String? reported;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'user')
  User? user;

  CommentDto({this.id, this.body, this.reported, this.createdAt, this.updatedAt, this.user});

   factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CommentDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: false)
class User {
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

  User({this.id, this.name, this.email, this.phone, this.whatsapp, this.role, this.image, this.city});

   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

   Map<String, dynamic> toJson() => _$UserToJson(this);
}

import 'package:json_annotation/json_annotation.dart'; 

part 'profile_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class ProfileDtoTest {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'token')
  String? token;

  ProfileDtoTest({this.id, this.name, this.email, this.phone, this.role, this.image, this.token});

   factory ProfileDtoTest.fromJson(Map<String, dynamic> json) => _$ProfileDtoTestFromJson(json);

   Map<String, dynamic> toJson() => _$ProfileDtoTestToJson(this);
}


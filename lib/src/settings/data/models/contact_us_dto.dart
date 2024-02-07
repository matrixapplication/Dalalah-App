import 'package:json_annotation/json_annotation.dart'; 

part 'contact_us_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ContactUsDto {
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;

  ContactUsDto({this.address, this.phone, this.email});

   factory ContactUsDto.fromJson(Map<String, dynamic> json) => _$ContactUsDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ContactUsDtoToJson(this);
}


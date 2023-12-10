import 'package:json_annotation/json_annotation.dart'; 

part 'car_country_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class CarCountryDto {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'name')
  String? name;

  CarCountryDto({this.key, this.name});

   factory CarCountryDto.fromJson(Map<String, dynamic> json) => _$CarCountryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CarCountryDtoToJson(this);
}


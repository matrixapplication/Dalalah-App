import 'package:json_annotation/json_annotation.dart'; 

part 'city_dto.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class CityDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  CityDto({this.id, this.name});

   factory CityDto.fromJson(Map<String, dynamic> json) => _$CityDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CityDtoToJson(this);
}


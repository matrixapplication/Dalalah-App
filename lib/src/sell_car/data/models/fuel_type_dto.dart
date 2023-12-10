import 'package:json_annotation/json_annotation.dart'; 

part 'fuel_type_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class FuelTypeDto {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'name')
  String? name;

  FuelTypeDto({this.key, this.name});

   factory FuelTypeDto.fromJson(Map<String, dynamic> json) => _$FuelTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$FuelTypeDtoToJson(this);
}


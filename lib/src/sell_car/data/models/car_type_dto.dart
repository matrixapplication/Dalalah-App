import 'package:json_annotation/json_annotation.dart'; 

part 'car_type_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class CarTypeDto {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'name')
  String? name;

  CarTypeDto({this.key, this.name});

   factory CarTypeDto.fromJson(Map<String, dynamic> json) => _$CarTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CarTypeDtoToJson(this);
}


import 'package:json_annotation/json_annotation.dart'; 

part 'car_status_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class CarStatusDto {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'name')
  String? name;

  CarStatusDto({this.key, this.name});

   factory CarStatusDto.fromJson(Map<String, dynamic> json) => _$CarStatusDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CarStatusDtoToJson(this);
}


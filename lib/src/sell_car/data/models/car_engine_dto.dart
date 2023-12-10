import 'package:json_annotation/json_annotation.dart'; 

part 'car_engine_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class CarEngineDto {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'name')
  String? name;

  CarEngineDto({this.key, this.name});

   factory CarEngineDto.fromJson(Map<String, dynamic> json) => _$CarEngineDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CarEngineDtoToJson(this);
}


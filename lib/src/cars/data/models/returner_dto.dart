import 'package:json_annotation/json_annotation.dart'; 

part 'returner_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ReturnerDto {
  @JsonKey(name: 'serial')
  String? serial;
  @JsonKey(name: 'shpments')
  int? shpments;

  ReturnerDto({this.serial, this.shpments});

   factory ReturnerDto.fromJson(Map<String, dynamic> json) => _$ReturnerDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ReturnerDtoToJson(this);
}


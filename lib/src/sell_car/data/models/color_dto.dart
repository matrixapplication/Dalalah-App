import 'package:json_annotation/json_annotation.dart'; 

part 'color_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class ColorDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'value')
  String? value;

  ColorDto({this.id, this.name, this.value});

   factory ColorDto.fromJson(Map<String, dynamic> json) => _$ColorDtoFromJson(json);

   Map<String, dynamic> toJson() => _$ColorDtoToJson(this);
}


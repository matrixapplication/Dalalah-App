import 'package:json_annotation/json_annotation.dart'; 

part 'body_type_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class BodyTypeDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'icon')
  String? icon;

  BodyTypeDto({this.id, this.name, this.icon});

   factory BodyTypeDto.fromJson(Map<String, dynamic> json) => _$BodyTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BodyTypeDtoToJson(this);
}


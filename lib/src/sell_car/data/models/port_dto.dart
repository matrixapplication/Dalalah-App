import 'package:json_annotation/json_annotation.dart'; 

part 'port_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class PortDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'price')
  int? price;

  PortDto({this.id, this.name, this.price});

   factory PortDto.fromJson(Map<String, dynamic> json) => _$PortDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PortDtoToJson(this);
}


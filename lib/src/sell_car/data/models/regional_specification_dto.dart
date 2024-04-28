import 'package:json_annotation/json_annotation.dart';

part 'regional_specification_dto.g.dart';

@JsonSerializable()
class RegionalSpecificationDto {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;

  RegionalSpecificationDto ({
    this.id,
    this.name,
  });

  factory RegionalSpecificationDto.fromJson(Map<String, dynamic> json) {
    return _$RegionalSpecificationDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegionalSpecificationDtoToJson(this);
  }
}



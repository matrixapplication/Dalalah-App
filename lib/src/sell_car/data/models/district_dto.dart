import 'package:json_annotation/json_annotation.dart'; 

part 'district_dto.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class DistrictDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  DistrictDto({this.id, this.name});

   factory DistrictDto.fromJson(Map<String, dynamic> json) => _$DistrictDtoFromJson(json);

   Map<String, dynamic> toJson() => _$DistrictDtoToJson(this);
}


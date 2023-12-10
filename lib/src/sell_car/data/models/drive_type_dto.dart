import 'package:json_annotation/json_annotation.dart'; 

part 'drive_type_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class DriveTypeDto {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'name')
  String? name;

  DriveTypeDto({this.key, this.name});

   factory DriveTypeDto.fromJson(Map<String, dynamic> json) => _$DriveTypeDtoFromJson(json);

   Map<String, dynamic> toJson() => _$DriveTypeDtoToJson(this);
}


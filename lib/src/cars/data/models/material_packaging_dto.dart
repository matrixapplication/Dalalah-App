import 'package:json_annotation/json_annotation.dart'; 

part 'material_packaging_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class MaterialPackagingDto {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'count')
  int? count;

  MaterialPackagingDto({this.type, this.count});

   factory MaterialPackagingDto.fromJson(Map<String, dynamic> json) => _$MaterialPackagingDtoFromJson(json);

   Map<String, dynamic> toJson() => _$MaterialPackagingDtoToJson(this);
}


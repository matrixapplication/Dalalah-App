import 'package:json_annotation/json_annotation.dart'; 

part 'brand_model_extension_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class BrandModelExtensionDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'model')
  String? model;
  @JsonKey(name: 'name')
  String? name;

  BrandModelExtensionDto({this.id, this.model, this.name});

   factory BrandModelExtensionDto.fromJson(Map<String, dynamic> json) => _$BrandModelExtensionDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BrandModelExtensionDtoToJson(this);
}


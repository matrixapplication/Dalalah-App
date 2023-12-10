import 'package:json_annotation/json_annotation.dart'; 

part 'brand_model_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class BrandModelDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'brand')
  String? brand;
  @JsonKey(name: 'name')
  String? name;

  BrandModelDto({this.id, this.brand, this.name});

   factory BrandModelDto.fromJson(Map<String, dynamic> json) => _$BrandModelDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BrandModelDtoToJson(this);
}


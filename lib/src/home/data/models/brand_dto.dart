import 'package:json_annotation/json_annotation.dart'; 

part 'brand_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class BrandDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'image')
  String? image;

  BrandDto({this.id, this.name, this.image});

   factory BrandDto.fromJson(Map<String, dynamic> json) => _$BrandDtoFromJson(json);

   Map<String, dynamic> toJson() => _$BrandDtoToJson(this);
}


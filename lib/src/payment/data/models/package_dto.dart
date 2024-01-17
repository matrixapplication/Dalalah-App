import 'package:json_annotation/json_annotation.dart'; 

part 'package_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PackageDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'period')
  String? period;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'created_at')
  String? createdAt;

  PackageDto({this.id, this.name, this.period, this.price, this.description, this.createdAt});

   factory PackageDto.fromJson(Map<String, dynamic> json) => _$PackageDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PackageDtoToJson(this);
}


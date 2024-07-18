import 'package:json_annotation/json_annotation.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';

part 'real_estate_type_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RealEstateCategoryDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'icon')
  String? icon;
  RealEstateCategoryDto({this.id, this.name, this.icon});


   factory RealEstateCategoryDto.fromJson(Map<String, dynamic> json) => _$RealEstateCategoryDtoFromJson(json);

   Map<String, dynamic> toJson() => _$RealEstateCategoryDtoToJson(this);
}


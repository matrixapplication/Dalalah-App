import 'package:json_annotation/json_annotation.dart'; 

part 'feature_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class FeatureDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'options')
  List<Option>? options;

  FeatureDto({this.id, this.name, this.options});

   factory FeatureDto.fromJson(Map<String, dynamic> json) => _$FeatureDtoFromJson(json);

   Map<String, dynamic> toJson() => _$FeatureDtoToJson(this);
}

@JsonSerializable(ignoreUnannotated: true)
class Option {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'icon')
  String? icon;

  Option({this.id, this.name, this.icon});

   factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

   Map<String, dynamic> toJson() => _$OptionToJson(this);
}


import 'package:json_annotation/json_annotation.dart';

part 'category_details_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class RealEstateCategoryDetailsDto {
  List<DetailsDto>? details;
  List<FeaturesDto>? features;

  RealEstateCategoryDetailsDto({this.details, this.features});

  factory RealEstateCategoryDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$RealEstateCategoryDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RealEstateCategoryDetailsDtoToJson(this);
}

@JsonSerializable()
class DetailsDto {
  int? id;
  String? name;
  String? unit;
  String? type;
  dynamic min;
  dynamic max;
  String? icon;
  List<OptionsDto>? options;

  DetailsDto(
      {this.id,
        this.name,
        this.unit,
        this.type,
        this.min,
        this.max,
        this.icon,
        this.options});

  factory DetailsDto.fromJson(Map<String, dynamic> json) =>
      _$DetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsDtoToJson(this);
}

@JsonSerializable()
class OptionsDto {
  int? id;
  String? name;

  OptionsDto({this.id, this.name});

  factory OptionsDto.fromJson(Map<String, dynamic> json) =>
      _$OptionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsDtoToJson(this);
}

@JsonSerializable()
class FeaturesDto {
  int? id;
  String? name;
  String? icon;

  FeaturesDto({this.id, this.name, this.icon});

  factory FeaturesDto.fromJson(Map<String, dynamic> json) =>
      _$FeaturesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturesDtoToJson(this);
}

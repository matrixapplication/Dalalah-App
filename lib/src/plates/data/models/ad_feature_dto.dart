import 'package:json_annotation/json_annotation.dart'; 

part 'ad_feature_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class AdFeatureDto {
  @JsonKey(name: 'feature_basic_duration')
  dynamic featureBasicDuration;
  @JsonKey(name: 'feature_duration')
  dynamic featureDuration;
  @JsonKey(name: 'feature_duration_price')
  dynamic featureDurationPrice;

  AdFeatureDto({this.featureBasicDuration, this.featureDuration, this.featureDurationPrice});

   factory AdFeatureDto.fromJson(Map<String, dynamic> json) => _$AdFeatureDtoFromJson(json);

   Map<String, dynamic> toJson() => _$AdFeatureDtoToJson(this);
}


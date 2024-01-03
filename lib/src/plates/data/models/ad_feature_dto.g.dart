// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_feature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdFeatureDto _$AdFeatureDtoFromJson(Map<String, dynamic> json) => AdFeatureDto(
      featureBasicDuration: json['feature_basic_duration'] as String?,
      featureDuration: json['feature_duration'] as String?,
      featureDurationPrice: json['feature_duration_price'] as String?,
    );

Map<String, dynamic> _$AdFeatureDtoToJson(AdFeatureDto instance) =>
    <String, dynamic>{
      'feature_basic_duration': instance.featureBasicDuration,
      'feature_duration': instance.featureDuration,
      'feature_duration_price': instance.featureDurationPrice,
    };

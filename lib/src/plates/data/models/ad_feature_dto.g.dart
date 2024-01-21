// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_feature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdFeatureDto _$AdFeatureDtoFromJson(Map<String, dynamic> json) => AdFeatureDto(
      featureBasicDuration: json['feature_basic_duration'] ,
      featureDuration: json['feature_duration'],
      featureDurationPrice: json['feature_duration_price'] ,
    );

Map<String, dynamic> _$AdFeatureDtoToJson(AdFeatureDto instance) =>
    <String, dynamic>{
      'feature_basic_duration': instance.featureBasicDuration,
      'feature_duration': instance.featureDuration,
      'feature_duration_price': instance.featureDurationPrice,
    };

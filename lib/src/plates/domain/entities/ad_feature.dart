
import '../../data/models/ad_feature_dto.dart';

class AdFeature {
  String? featureBasicDuration;
  String? featureDuration;
  String? featureDurationPrice;

  AdFeature({this.featureBasicDuration, this.featureDuration, this.featureDurationPrice});

   factory AdFeature.fromDto(AdFeatureDto json) => AdFeature(
        featureBasicDuration: json.featureBasicDuration,
        featureDuration: json.featureDuration,
        featureDurationPrice: json.featureDurationPrice,
    );
}


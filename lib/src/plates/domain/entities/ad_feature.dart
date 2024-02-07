
import '../../data/models/ad_feature_dto.dart';

class AdFeature {
  String? featureBasicDuration;
  String? featureDuration;
  String? featureDurationPrice;

  AdFeature({this.featureBasicDuration, this.featureDuration, this.featureDurationPrice});

   factory AdFeature.fromDto(AdFeatureDto json) => AdFeature(
        featureBasicDuration: json.featureBasicDuration.toString(),
        featureDuration: json.featureDuration.toString(),
        featureDurationPrice: json.featureDurationPrice.toString(),
    );
}


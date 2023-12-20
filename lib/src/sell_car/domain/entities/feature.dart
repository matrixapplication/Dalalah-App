
import '../../data/models/feature_dto.dart';

class Feature {
  int? id;
  String? name;
  List<OptionDto>? options;

  Feature({this.id, this.name, this.options});

   factory Feature.fromDto(FeatureDto json) {
     return Feature(
       id: json.id,
       name: json.name,
       options: json.options,
     );
   }
}
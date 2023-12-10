
import '../../data/models/brand_model_extension_dto.dart';

class BrandModelExtension {
  int? id;
  String? model;
  String? name;

  BrandModelExtension({this.id, this.model, this.name});

   factory BrandModelExtension.fromDto(BrandModelExtensionDto json) => BrandModelExtension(
      id: json.id,
      model: json.model,
      name: json.name
   );
}


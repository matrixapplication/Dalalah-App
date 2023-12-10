
import '../../data/models/brand_model_dto.dart';

class BrandModel {
  int? id;
  String? brand;
  String? name;

  BrandModel({this.id, this.brand, this.name});

   factory BrandModel.fromDto(BrandModelDto json) => BrandModel(
     id: json.id,
     brand: json.brand,
     name: json.name
   );
}


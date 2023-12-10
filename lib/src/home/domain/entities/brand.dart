
import '../../data/models/brand_dto.dart';

class Brand {
  int? id;
  String? name;
  String? image;

  Brand({this.id, this.name, this.image});

   factory Brand.fromDto(BrandDto json) {
    return Brand(
      id: json.id,
      name: json.name,
      image: json.image,
    );
   }
}


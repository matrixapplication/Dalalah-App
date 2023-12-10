
import '../../data/models/fuel_type_dto.dart';

class FuelType {
  String? key;
  String? name;

  FuelType({this.key, this.name});

   factory FuelType.fromDto(FuelTypeDto json) {
      return FuelType(
        key: json.key,
        name: json.name
      );
   }
}


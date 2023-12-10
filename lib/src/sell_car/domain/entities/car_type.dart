
import '../../data/models/car_type_dto.dart';

class CarType {
  String? key;
  String? name;

  CarType({this.key, this.name});

   factory CarType.fromDto(CarTypeDto json) {
      return CarType(
        key: json.key,
        name: json.name
      );
   }
}


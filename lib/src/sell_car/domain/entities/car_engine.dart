
import '../../data/models/car_engine_dto.dart';

class CarEngine {
  String? key;
  String? name;

  CarEngine({this.key, this.name});

   factory CarEngine.fromDto(CarEngineDto json) {
     return CarEngine(
       key: json.key,
       name: json.name
     );
   }
}


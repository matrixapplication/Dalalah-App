
import '../../data/models/car_status_dto.dart';

class CarStatus {
  String? key;
  String? name;

  CarStatus({this.key, this.name});

   factory CarStatus.fromDto(CarStatusDto json) => CarStatus(
      key: json.key,
      name: json.name
   );
}


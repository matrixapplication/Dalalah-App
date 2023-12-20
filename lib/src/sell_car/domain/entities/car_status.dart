
import '../../data/models/car_status_dto.dart';

class CarStatus {
  String? key;
  String? name;

  CarStatus({this.key, this.name});

   factory CarStatus.fromDto(CarStatusDto json) => CarStatus(
      key: json.key,
      name: json.name
   );


  static const String newCar = 'new';
  static const String usedCar = 'used';
  static const String all = 'all';

  static String? getStatusByIndex(int index) {
    switch (index) {
      case 0:
        return null;
      case 1:
        return newCar;
      case 2:
        return usedCar;
      default:
        return null;
    }
  }
}



import '../../data/models/car_country_dto.dart';

class CarCountry {
  String? key;
  String? name;

  CarCountry({this.key, this.name});

   factory CarCountry.fromDto(CarCountryDto json){
     return CarCountry(
       key: json.key,
       name: json.name
     );
   }
}


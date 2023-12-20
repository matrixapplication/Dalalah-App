
import '../../../home/data/models/car_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';
import '../../../sell_car/domain/entities/city.dart';
import '../../data/models/same_car_dto.dart';

class SameCar {
  int? id;
  String? modelRole;
  ShowroomDto? showroom;
  City? city;
  String? price;
  int? monthlyInstallment;
  String? description;
  String? mainImage;
  List<ImageDto>? images;

  SameCar({this.id, this.modelRole, this.showroom, this.city, this.price, this.monthlyInstallment, this.description, this.mainImage, this.images});

   factory SameCar.fromDto(SameCarDto json) {
     return SameCar(
       id: json.id,
       modelRole: json.modelRole,
       showroom: json.showroom,
       city: City.fromDto(json.city ?? CityDto()),
       price: json.price,
       monthlyInstallment: json.monthlyInstallment,
       description: json.description,
       mainImage: json.mainImage,
       images: json.images,
     );
   }
}


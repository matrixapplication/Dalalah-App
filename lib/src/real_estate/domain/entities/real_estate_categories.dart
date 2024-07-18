
import '../../../profile/data/models/profile_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';
import '../../data/models/real_estate_type_dto.dart';


class RealEstateCategory {
  int? id;
  String? name;
  String? icon;

  RealEstateCategory({this.id, this.name, this.icon});

  factory RealEstateCategory.fromDto(RealEstateCategoryDto json) {
     return RealEstateCategory(
       id: json.id,
       name: json.name??'',
       icon: json.icon??'',
     );
   }
}


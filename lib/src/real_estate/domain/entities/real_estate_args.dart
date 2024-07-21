
import '../../../profile/data/models/profile_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';
import '../../data/models/add_real_estate_params.dart';
import '../../data/models/category_details_dto.dart';
import '../../data/models/real_estate_type_dto.dart';


class RealEstateArgs {
  RealEstateCategoryDetailsDto categoryDetailsDto;
  AddRealEstateParams addRealEstateParams;
  String categoryName;

  RealEstateArgs({
    required this.categoryDetailsDto,
    required this.addRealEstateParams,
    required this.categoryName,
  });


  Map<String, dynamic> toMap() {
    return {
      'categoryDetailsDto': categoryDetailsDto.toJson(),
      'addRealEstateParams': addRealEstateParams.toJson(),
      'categoryName': categoryName,
    };
  }

}



import '../../../../core/network/api_response.dart';
import '../../data/models/add_real_estate_params.dart';
import '../../data/models/category_details_dto.dart';
import '../../data/models/get_real_estate_params.dart';
import '../../data/models/real_estate_model.dart';
import '../../data/models/real_estate_type_dto.dart';
import '../entities/real_estate.dart';

abstract class BaseRealEstateRepo {
  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories();
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(int id);
  Future<RealEstatesModel> fetchRealEstates(AddRealEstateParams params);


  Future<dynamic> addRealEstate(AddRealEstateParams params);
}

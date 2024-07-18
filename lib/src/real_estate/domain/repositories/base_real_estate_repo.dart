
import '../../../../core/network/api_response.dart';
import '../../data/models/category_details_dto.dart';
import '../../data/models/real_estate_type_dto.dart';
import '../entities/real_estate.dart';

abstract class BaseRealEstateRepo {
  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories();
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(int id);
}

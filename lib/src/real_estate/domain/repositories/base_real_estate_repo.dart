
import '../../../../core/network/api_response.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../../sell_car/data/models/edit_image_params.dart';
import '../../data/models/add_real_estate_params.dart';
import '../../data/models/category_details_dto.dart';
import '../../data/models/get_real_estate_params.dart';
import '../../data/models/my_properties_response.dart';
import '../../data/models/properties_developers.dart';
import '../../data/models/real_estate_model.dart';
import '../../data/models/real_estate_params.dart';
import '../../data/models/real_estate_type_dto.dart';
import '../../data/models/update_real_estate_params.dart';
import '../entities/real_estate.dart';

abstract class BaseRealEstateRepo {
  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories();
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(int id);
  Future<RealEstatesModel> fetchRealEstates(RealEstateParams params);
  Future<Property> fetchPropertyDetails(int id);
  Future<dynamic> editRealEstate(AddRealEstateParams params,int id);
  Future<dynamic> addRealEstate(AddRealEstateParams params);
  Future<List<PropertiesDevelopers>> getPropertiesDevelopers(int page);


  Future<ApiResponse> hideProperty(int id);
  Future<ApiResponse> soldProperty(int id);
  Future<ApiResponse> addSpecialProperty(AdSpecialParams params);
  Future<ApiResponse> deleteProperty(int id);
  Future<ApiResponse> updatePropertyDate(UpdateRealEstateParams params,int id);
  Future<ApiResponse> editPropertyImage(EditImageCarParams params);
  Future<ApiResponse> deletePropertyImage(int id);
  Future<ApiResponse> addPropertyImage(EditImageCarParams params);
}

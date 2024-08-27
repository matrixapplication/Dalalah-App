import 'dart:io';

import 'package:dalalah/src/real_estate/data/models/real_estate_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../../plates/data/models/plate_dto.dart';
import '../../../profile/data/models/profile_dto.dart';
import '../../../sell_car/data/models/edit_image_params.dart';
import '../../../showrooms/data/models/add_rate_params.dart';
import '../../data/models/add_rate_developer_params.dart';
import '../../data/models/add_real_estate_params.dart';
import '../../data/models/category_details_dto.dart';
import '../../data/models/get_real_estate_params.dart';
import '../../data/models/my_properties_response.dart';
import '../../data/models/properties_developer_details.dart';
import '../../data/models/properties_developers.dart';
import '../../data/models/real_estate_params.dart';
import '../../data/models/real_estate_type_dto.dart';
import '../../data/models/update_real_estate_params.dart';
import '../entities/real_estate.dart';
import '../repositories/base_real_estate_repo.dart';

@Injectable()
class RealEstateUseCase {
  final BaseRealEstateRepo repository;

  RealEstateUseCase(this.repository);

  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories() async {
    return await repository.fetchRealEstateCategories();
  }
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(int id) async {
    return await repository.fetchRealEstateCategoriesDetails(id);
  }

  Future<dynamic> addRealEstate(AddRealEstateParams params) async {
    return await repository.addRealEstate(params);
  }
  Future<dynamic> editRealEstate(AddRealEstateParams params,int id) async {
    return await repository.editRealEstate(params,id);
  }
  Future<RealEstatesModel> fetchRealEstates(RealEstateParams params) async {
    final res =await repository.fetchRealEstates(params);
    HelperMethods.saveProperties(res);

    return res;
  }

  Future<Property> fetchPropertyDetails(int id ) async {
    return await repository.fetchPropertyDetails(id);
  }

  Future<String> hideProperty(int id) async {
    final data = await repository.hideProperty(id);
    return data.message ?? '';
  }

  Future<String> soldProperty(int id) async {
    final data = await repository.soldProperty(id);
    return data.message ?? '';
  }

  Future<String> addSpecialProperty(AdSpecialParams params) async {
    final data = await repository.addSpecialProperty(params);
    return data.message ?? '';
  }

  Future<String> deleteProperty(int id) async {
    final data = await repository.deleteProperty(id);
    return data.message ?? '';
  }

  Future<String> updatePropertyDate(int id) async {
    ProfileDto? profile = await HelperMethods.getProfile();
    final data = await repository.updatePropertyDate(
      UpdateRealEstateParams(),
          id
    );
    return data.message ?? '';
  }


  Future<ApiResponse<List<PropertiesDevelopers>>> fetchPropertiesDevelopers(int page) async {
    return await repository.getPropertiesDevelopers(page);
  }
  Future<PropertiesDeveloperDetails> fetchPropertiesDevelopersDetails(int id) async {
    return await repository.fetchPropertiesDevelopersDetails(id);
  }
  Future<String> editPropertyImage(EditImageCarParams params) async{
    final data = await repository.editPropertyImage(params);
    return data.message ?? '';
  }

  Future<String> addPropertyImage(List<File> images, int id) async{
    final data = await repository.addPropertyImage(images,id);
    return data.message ?? '';
  }

  Future<String> deletePropertyImage(int id) async{
    final data = await repository.deletePropertyImage(id);
    return data.message ?? '';
  }


  Future<String> addFollowDeveloper(int id) async {
    final data = await repository.addFollowDeveloper(id);
    return data ?? '';
  }



  Future<String> addRateDeveloper(AddRateDeveloperParams params) async {
    final data = await repository.addRateDeveloper(params);
    return data ?? '';
  }
}

import 'dart:io';

import 'package:dalalah/src/real_estate/data/models/add_real_estate_params.dart';
import 'package:dalalah/src/real_estate/data/models/get_real_estate_params.dart';
import 'package:dalalah/src/real_estate/data/models/my_properties_response.dart';
import 'package:dalalah/src/real_estate/data/models/properties_developers.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../cars/data/models/add_special_params.dart';
import '../../../sell_car/data/models/edit_image_params.dart';
import '../../domain/entities/real_estate.dart';
import '../../domain/repositories/base_real_estate_repo.dart';
import '../data_sources/real_estate_datasource.dart';
import '../models/category_details_dto.dart';
import '../models/properties_developer_details.dart';
import '../models/real_estate_model.dart';
import '../models/real_estate_params.dart';
import '../models/real_estate_type_dto.dart';
import '../models/update_real_estate_params.dart';

@Injectable(as: BaseRealEstateRepo)
class RealEstateRepo extends BaseRealEstateRepo {
  final RealEstateDatasource datasource;

  RealEstateRepo(this.datasource);

  @override
  Future<List<RealEstateCategoryDto>> fetchRealEstateCategories() async {
    final data = await datasource.fetchRealEstateCategories();
    return data.data!;
  }

  @override
  Future<RealEstateCategoryDetailsDto> fetchRealEstateCategoriesDetails(
      int id) async {
    final data = await datasource.fetchRealEstateCategoriesDetails(id);
    return data.data!;
  }

  @override
  Future<RealEstatesModel> fetchRealEstates(RealEstateParams params) async {
    final data = await datasource.fetchRealEstates(params);
    print("sdsfsdf ${data.toString()}");
    return data.data!;
  }

  @override
  Future<String> addRealEstate(AddRealEstateParams params) async {

    final ids=params.detailsList?.map((e) => e.id?.toString() ?? '0').toList() ?? [];
    final values=params.detailsList?.map((e) => e.title?.toString() ?? '0').toList() ?? [];
    final data = await datasource.addRealEstate(
      params.type ?? '',
      params.status ?? '',
      params.categoryId ?? 0,
      params.price ?? 0,
      params.description ?? '',
      params.cityId ?? 0,
      params.streetName ?? '',
      params.lat ?? '',
      params.lng ?? '',
      params.features ?? [],
      params.cover!,
      params.images ?? [],
      ids,
      values,
    );

    return data.message!;
  }
  @override
  Future<String> editRealEstate(AddRealEstateParams params,int id) async {
    print("====================================================");
    print('params ${params.toJson().toString()}');
    print('detailsList ${params.detailsList!.map((e) => e.title)}');
    print('images ${params.images!.map((e) => e.path)}');
    print('cover ${params.cover}');
    final data = await datasource.editRealEstate(
      id,
      params.type ?? '',
      params.status ?? '',
      params.categoryId ?? 0,
      params.price ?? 0,
      params.description ?? '',
      params.cityId ?? 0,
      params.streetName ?? '',
      params.lat ?? '',
      params.lng ?? '',
      params.features ?? [],
      // params.cover!,
      // params.images!,
      params.detailsList?.map((e) => e.id?.toString() ?? '0').toList() ?? [],
      params.detailsList?.map((e) => e.title ?? '0').toList() ?? [],
    );

    return data.message!;
  }

  @override
  Future<ApiResponse> hideProperty(int id) async {
    return await datasource.hideProperty(id);
  }

  @override
  Future<ApiResponse> soldProperty(int id) async {
    return await datasource.soldProperty(id);
  }

  @override
  Future<ApiResponse> addSpecialProperty(AdSpecialParams params) async {
    return await datasource.addSpecialProperty(params);
  }

  @override
  Future<ApiResponse> deleteProperty(int id) async {
    return await datasource.deleteProperty(id);
  }

  @override
  Future<ApiResponse> updatePropertyDate(UpdateRealEstateParams params,int id) async {
    return await datasource.updatePropertyDate(params,id);
  }

  @override
  Future<List<PropertiesDevelopers>> getPropertiesDevelopers(int page) async{
     var res = await datasource.getPropertiesDevelopers(page);
     return res.data!;
  }

  @override
  Future<ApiResponse> editPropertyImage(EditImageCarParams params) {
    return datasource.editPropertyImage(params.carId, params.image!, params.imageId);
  }

  @override
  Future<ApiResponse> addPropertyImage(List<File> images, int id) {
    return datasource.addPropertyImage(images, id);
  }

  @override
  Future<ApiResponse> deletePropertyImage(int id) {
    return datasource.deletePropertyImage(id);
  }

  @override
  Future<Property> fetchPropertyDetails(int id)async {
    final res=await datasource.fetchPropertyDetails(id);
   return res.data!;
  }

  @override
  Future<PropertiesDeveloperDetails> fetchPropertiesDevelopersDetails(int id)async {
    final res=await datasource.fetchPropertiesDevelopersDetails(id);
    return res.data!;
  }
}

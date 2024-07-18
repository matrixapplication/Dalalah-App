import 'dart:io';

import 'package:dalalah/src/real_estate/data/models/category_details_dto.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../../data/models/add_real_estate_params.dart';
import '../../../data/models/real_estate_type_dto.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';


@Injectable()
class AddRealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;
  final SellCarUseCase sellCarUseCase;

  AddRealEstatePageCubit(this.usecase, this.sellCarUseCase);
  StreamStateInitial<List<RealEstateCategoryDto>?> categoriesList = StreamStateInitial();
  StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetails = StreamStateInitial();
  AddRealEstateParams addRealEstateParams=AddRealEstateParams();
  fetchRealEstateCategories() async {
    categoriesList.setData(null);
    try {
      final response = await usecase.fetchRealEstateCategories();
      categoriesList.setData(response);
      await fetchRealEstateCategoriesDetails(categoriesList.data![0].id!);
    } catch (e) {
      categoriesList.setError(e);
      // rethrow;
    }
  }
  fetchRealEstateCategoriesDetails(int id) async {
    categoriesDetails.setData(null);
    try {
      final response = await usecase.fetchRealEstateCategoriesDetails(id);
      categoriesDetails.setData(response);
    } catch (e) {
      categoriesDetails.setError(e);
      // rethrow;
    }
  }
  void fetchCities() {
    executeSuccessNotLoading(() => sellCarUseCase.fetchCities());
  }
  void updateRealEstateParams({
    String? newTitle,
    String? newType,
    String? newStatus,
    int? newCategoryId,
    dynamic newPrice,
    String? newDescription,
    int? newCityId,
    String? newStreetName,
    String? newLat,
    String? newLng,
    File? newCover,
    List<File>? newImages,
    List<int>? newFeatures,
    List<DetailsItemModelDto>? newDetailsList
  }) {
    if (newTitle != null) addRealEstateParams.title = newTitle;
    if (newType != null) addRealEstateParams.type = newType;
    if (newStatus != null) addRealEstateParams.status = newStatus;
    if (newCategoryId != null) addRealEstateParams.categoryId = newCategoryId;
    if (newPrice != null) addRealEstateParams.price = newPrice;
    if (newDescription != null) addRealEstateParams.description = newDescription;
    if (newCityId != null) addRealEstateParams.cityId = newCityId;
    if (newStreetName != null) addRealEstateParams.streetName = newStreetName;
    if (newLat != null) addRealEstateParams.lat = newLat;
    if (newLng != null) addRealEstateParams.lng = newLng;
    if (newCover != null) addRealEstateParams.cover = newCover;
    if (newImages != null) addRealEstateParams.images = [...?addRealEstateParams.images, ...newImages];
    if (newFeatures != null) addRealEstateParams.features = [...?addRealEstateParams.features, ...newFeatures];
    if (newDetailsList != null) addRealEstateParams.detailsList = [...?addRealEstateParams.detailsList, ...newDetailsList];
  }
}

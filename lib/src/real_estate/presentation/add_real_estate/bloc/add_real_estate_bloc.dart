import 'dart:io';

import 'package:dalalah/src/real_estate/data/models/category_details_dto.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../../core/resources/data_state.dart';
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
  Future<void> addRealEstate(AddRealEstateParams params) async {
    emit(LoadingStateListener());
    try {
    var res =  await usecase.addRealEstate(params);
      emit(SuccessStateListener<String>(res.toString()));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

}

import 'dart:io';

import 'package:dalalah/core/resources/data_state.dart';
import 'package:dalalah/src/real_estate/data/models/category_details_dto.dart';
import 'package:dalalah/src/real_estate/presentation/add_real_estate/bloc/real_estate_categories_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../../data/models/add_real_estate_params.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';


@Injectable()
class AddRealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;
  final SellCarUseCase sellCarUseCase;

  AddRealEstatePageCubit(this.usecase, this.sellCarUseCase);

  StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetailsStream = StreamStateInitial();

  AddRealEstateParams addRealEstateParams=AddRealEstateParams();
  fetchRealEstateCategories() async {
    executeBuilder(
            isRefresh: true,
            () => usecase.fetchRealEstateCategories(), onSuccess: (data){
      RealEstateCategoriesState(
        realEstateCategoriesList: data,
        categoriesDetailsStream: categoriesDetailsStream,
      );
      fetchRealEstateCategoriesDetails(data![0].id!);
      emit(DataSuccess<RealEstateCategoriesState>(RealEstateCategoriesState(
        realEstateCategoriesList: data,
        categoriesDetailsStream: categoriesDetailsStream,
      )));
    });
  }
  fetchRealEstateCategoriesDetails(int id) async {
    categoriesDetailsStream.setData(null);
    try {
      final response = await usecase.fetchRealEstateCategoriesDetails(id);
      categoriesDetailsStream.setData(response);
    } catch (e) {
      categoriesDetailsStream.setError(e);
    }
  }

  void fetchCities() {
    executeSuccessNotLoading(() => sellCarUseCase.fetchCities());
  }
  Future<void> addRealEstate(AddRealEstateParams params) async {
    executeEmitterListener(() => usecase.addRealEstate(params));
  }

}

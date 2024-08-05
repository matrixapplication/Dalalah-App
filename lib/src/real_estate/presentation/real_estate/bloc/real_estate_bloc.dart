import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../data/models/add_real_estate_params.dart';
import '../../../data/models/category_details_dto.dart';
import '../../../data/models/get_real_estate_params.dart';
import '../../../data/models/real_estate_model.dart';
import '../../../data/models/real_estate_params.dart';
import '../../../data/models/real_estate_type_dto.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';

@Injectable()
class RealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;
  RealEstatePageCubit(this.usecase);
  StreamStateInitial<RealEstatesModel?> realEstatesData = StreamStateInitial();
  StreamStateInitial<List<RealEstateCategoryDto>?> categoriesList = StreamStateInitial();
  StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetails = StreamStateInitial();

  fetchRealEstateCategories() async {
    categoriesList.setData(null);
    try {
      final response = await usecase.fetchRealEstateCategories();
      categoriesList.setData(response);
      await fetchRealEstateCategoriesDetails(categoriesList.data![0].id!);
    } catch (e) {
      categoriesList.setError(e);
      rethrow;
    }
  }
  fetchRealEstateCategoriesDetails(int id) async {
    categoriesDetails.setData(null);
    try {
      final response = await usecase.fetchRealEstateCategoriesDetails(id);
      categoriesDetails.setData(response);
    } catch (e) {
      categoriesDetails.setError(e);
      rethrow;
    }
  }

  fetchRealEstates(RealEstateParams params) async {
    print('testggg ${params.toJson().toString()}');
    realEstatesData.setData(null);
    try {
      final response = await usecase.fetchRealEstates(params);
      realEstatesData.setData(response);
    } catch (e) {
      realEstatesData.setError(e);
      // rethrow;
    }
  }

  fetchPropertyDetails(int id) async {
    executeSuccess(() => usecase.fetchPropertyDetails(id));
  }
}

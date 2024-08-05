import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/commen/common_state.dart';
import '../../../data/models/category_details_dto.dart';
import '../../../data/models/real_estate_type_dto.dart';
import '../../../domain/use_cases/real_estate_usecase.dart';

@Injectable()
class FilterRealEstatePageCubit extends BaseCubit {
  final RealEstateUseCase usecase;

  FilterRealEstatePageCubit(this.usecase);

  //
  // StreamStateInitial<List<RealEstateCategoryDto>?> categoriesList = StreamStateInitial();
  // StreamStateInitial<RealEstateCategoryDetailsDto?> categoriesDetails = StreamStateInitial();
  // fetchRealEstateCategories() async {
  //   categoriesList.setData(null);
  //   try {
  //     final response = await usecase.fetchRealEstateCategories();
  //     categoriesList.setData(response);
  //     await fetchRealEstateCategoriesDetails(categoriesList.data![0].id!);
  //   } catch (e) {
  //     categoriesList.setError(e);
  //     rethrow;
  //   }
  // }
  // fetchRealEstateCategoriesDetails(int id) async {
  //   categoriesDetails.setData(null);
  //   try {
  //     final response = await usecase.fetchRealEstateCategoriesDetails(id);
  //     categoriesDetails.setData(response);
  //   } catch (e) {
  //     categoriesDetails.setError(e);
  //     rethrow;
  //   }
  // }
}

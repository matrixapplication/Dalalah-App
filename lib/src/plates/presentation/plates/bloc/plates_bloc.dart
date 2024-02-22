import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/entities/plate.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class PlatesCubit extends BaseCubit {
  final PlatesUseCase usecase;
  final FavoritesUseCase favoritesUseCase;

  PlatesCubit(this.usecase, this.favoritesUseCase);
  List<Plate> allPlates = [];
  int page = 0;
  bool isLastPage = false;

  fetchPlates(PlateFilterParams params, {bool isRefresh = true}) async {
    isRefresh ? {page = 1, allPlates.clear()} : page++;
    List<Plate> plates = [];
    print('page onSuccess$page');
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchPlates(params),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        print('isLastPage ${isLastPage}');
        plates = data.data?.map((e) => Plate.fromDto(e)).toList() ?? [];
        allPlates.addAll(plates);
        if(allPlates.isEmpty){
          throw EmptyListException();
        } else {
          emit(DataSuccess<List<Plate>>(allPlates));
        }
      },
    );
  }

  toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

}

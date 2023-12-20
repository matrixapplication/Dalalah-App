import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../data/models/add_to_favorite_params.dart';
import '../../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class MyPlatesCubit extends BaseCubit {
  final FavoritesUseCase usecase;

  MyPlatesCubit(this.usecase);

  // StreamStateInitial<bool>  isFavorite = StreamStateInitial<bool>();


  List<Plate> allPlates = [];
  List<Plate> plates = [];
  int page = 0;
  bool isLastPage = false;

  fetchMyPlates({bool isMoreData = false}) async {
    !isMoreData ? {page = 1, allPlates.clear()} : page++;
    print('page onSuccess$page');
    executeBuilder(
      isMoreData: isMoreData,
          () => usecase.fetchMyPlates(page),
      onSuccess: (data) {
        isLastPage = (data.pagination?.totalPages)! <= page;
        print('isLastPage ${isLastPage}');
        plates = data.data?.map((e) => Plate.fromDto(e)).toList() ?? [];
        allPlates.addAll(plates);
        plates.length > 15 ? null : plates = [];
        emit(DataSuccess<List<Plate>>(allPlates));
      },
    );
  }

  void toggleFavoritePlate(int id) async {
    executeEmitterListener(() => usecase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

}

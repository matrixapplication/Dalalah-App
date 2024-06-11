import 'package:dalalah/src/plates/domain/entities/ad_types.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/exceptions/empty_list_exception.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../cars/data/models/add_special_params.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/domain/use_cases/plates_usecase.dart';
import '../../../data/models/add_to_favorite_params.dart';
import '../../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class MyPlatesCubit extends BaseCubit {
  final FavoritesUseCase usecase;
  final PlatesUseCase platesUseCase;

  MyPlatesCubit(this.usecase, this.platesUseCase);

  // StreamStateInitial<bool>  isFavorite = StreamStateInitial<bool>();


  List<Plate> allPlates = [];
  int page = 0;
  bool isLastPage = false;

  fetchMyPlates({bool isRefresh = true}) async {
    isRefresh ? {page = 1, allPlates.clear()} : page++;
    List<Plate> plates = [];
    print('page onSuccess$page');
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchMyPlates(page),
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

  void toggleFavoritePlate(int id) async {
    executeEmitterListener(() => usecase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id)));
  }

  void hidePlate(int id) async {
    executeEmitterListener(() => platesUseCase.hidePlate(id));
  }

  void soldPlate(int id) async {
    executeEmitterListener(() => platesUseCase.soldPlate(id));
  }

  void deletePlate(int id) async {
    executeEmitterListener(() => platesUseCase.deletePlate(id));
  }

  void updateDate(int id) async {
    executeEmitterListener(() => platesUseCase.updatePlateDate(id));
  }

}

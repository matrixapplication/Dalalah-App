import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../data/models/add_to_favorite_params.dart';
import '../../../domain/use_cases/favorites_usecase.dart';

@Injectable()
class FavoritePlatesCubit extends BaseCubit {
  final FavoritesUseCase usecase;

  FavoritePlatesCubit(this.usecase);

  // StreamStateInitial<bool>  isFavorite = StreamStateInitial<bool>();


  List<Plate> allCars = [];
  List<Plate> cars = [];
  int page = 1;

  fetchFavoriteCars({bool isRefresh = true}) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    print('page onSuccess$page');
    executeBuilder(
      isRefresh: isRefresh,
          () => usecase.fetchFavoritePlates(page),
      onSuccess: (data) {
        cars = data;
        allCars.addAll(data);
        emit(DataSuccess<List<Plate>>(allCars));
      },
    );
  }

  void toggleFavoriteCar(int id) async {
    executeEmitterListener(() => usecase.toggleFavoriteCarOrPlate(AddToFavoriteParams(carId: id)));
  }


}

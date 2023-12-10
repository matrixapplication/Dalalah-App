import 'package:injectable/injectable.dart';

import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../../home/data/models/car_filter_params.dart';
import '../../../../home/domain/entities/brand.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../home/domain/use_cases/home_usecase.dart';
import '../../../../main_index.dart';
import '../../../domain/use_cases/cars_usecase.dart';

@Injectable()
class CarsCubit extends BaseCubit {
  final HomeUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  final CarsUseCase carsUseCase;

  CarsCubit(this.usecase, this.favoritesUseCase, this.carsUseCase);

  StreamStateInitial<List<Car>?> carsStream = StreamStateInitial();
  StreamStateInitial<List<Brand>> brandsStream = StreamStateInitial();

  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavorite(id));
  }

  List<Car> allCars = [];
  List<Car> cars = [];
  int page = 1;

  fetchCars(CarFilterParams params,
      {bool isRefresh = true, bool isShowroomUser = false}) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    print('page onSuccess$page');
    params.page = page;
    executeBuilder(
      isRefresh: isRefresh,
          () => isShowroomUser
          ? carsUseCase.fetchMyCars(page)
          : usecase.fetchCars(params),
      onSuccess: (data) {
        cars = data;
        allCars.addAll(data);
        emit(DataSuccess<List<Car>>(allCars));
      },
    );
  }

  fetchBrands() {
    executeSuccess(() => usecase.fetchBrands());
  }
}

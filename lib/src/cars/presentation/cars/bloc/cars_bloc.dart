import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../../home/data/models/car_filter_params.dart';
import '../../../../home/domain/entities/brand.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../home/domain/use_cases/home_usecase.dart';
import '../../../../main_index.dart';
import '../../../../price_requests/domain/use_cases/price_requests_usecase.dart';
import '../../../../sell_car/domain/entities/brand_model.dart';
import '../../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../../domain/use_cases/cars_usecase.dart';

@Injectable()
class CarsCubit extends BaseCubit {
  final HomeUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  final CarsUseCase carsUseCase;
  final SellCarUseCase sellCarUseCase;
  final PriceRequestsUseCase priceRequestsUseCase;

  CarsCubit(this.usecase, this.favoritesUseCase, this.carsUseCase, this.sellCarUseCase, this.priceRequestsUseCase);

  StreamStateInitial<List<Car>?> carsStream = StreamStateInitial();
  StreamStateInitial<List<Brand>> brandsStream = StreamStateInitial();
  StreamStateInitial<List<BrandModel>?> brandModelsStream = StreamStateInitial();

  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(carId: id)));
  }

  List<Car> allCars = [];
  List<Car> cars = [];
  int page = 1;

  fetchCars(CarFilterParams params,
      {bool isRefresh = true, bool isMyCars = false, }) async {
    isRefresh ? {page = 1, allCars.clear()} : page++;
    params.page = page;
    executeBuilder(
      isRefresh: isRefresh,
          () => isMyCars
          ? carsUseCase.fetchMyCars(page)
          : usecase.fetchCars(params),
      onSuccess: (data) {
        cars = data;
        allCars.addAll(cars);
        emit(DataSuccess<List<Car>>(allCars));
      },
    );
  }

  void fetchBrands() async{
    try {
      final brands = await usecase.fetchBrands();
      brandsStream.setData(brands);
    } catch (e) {
      brandsStream.setError(e);
    }
  }

  void fetchBrandModels(int id) async{
    brandModelsStream.setData(null);
    try {
      final models = await sellCarUseCase.fetchBrandModels(id);
      brandModelsStream.setData(models);
    } catch (e) {
      brandModelsStream.setError(e);
    }
  }

  void requestPrice(int id) async{
    executeEmitterListener(() => priceRequestsUseCase.priceRequest(id));
  }

}

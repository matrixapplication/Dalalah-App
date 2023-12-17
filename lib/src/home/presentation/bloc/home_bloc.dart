import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../data/models/car_filter_params.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/car.dart';
import '../../domain/entities/slide.dart';
import '../../domain/use_cases/home_usecase.dart';

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeUseCase usecase;
  final FavoritesUseCase favoritesUseCase;

  HomeCubit(this.usecase, this.favoritesUseCase);

  StreamStateInitial<List<Slide>?> slidesStream = StreamStateInitial();
  StreamStateInitial<List<Brand>?> brandsStream = StreamStateInitial();
  StreamStateInitial<List<Car>?> yourCarsStream = StreamStateInitial();
  StreamStateInitial<List<Car>?> otherCarsStream = StreamStateInitial();

  fetchInitialData() async {
    // emit(DataLoading());
    // try {
    //   await fetchSlides();
    //   await fetchBrands();
    //   await fetchCars();
    //   emit(DataLoading());
    // } on Exception catch (e) {
    //   emit(DataLoading());
    // }
    await fetchSlides();
    await fetchBrands();
    await fetchYourCars();
    //  await fetchOtherCars();
  }

  fetchSlides() async {
    slidesStream.setData(null);
    try {
      final response = await usecase.fetchSliders();
      slidesStream.setData(response);
    } catch (e) {
      slidesStream.setError(e);
    }
  }

  fetchBrands() async {
    brandsStream.setData(null);
    try {
      final response = await usecase.fetchBrands();
      brandsStream.setData(response);
    } catch (e) {
      brandsStream.setError(e);
    }
  }

  fetchYourCars() async {
    yourCarsStream.setData(null);
    try {
      // CarFilterParams(startYear: DateTime.now().year)
      final response = await usecase.fetchCars(CarFilterParams());
      yourCarsStream.setData(response);
    } catch (e) {
      yourCarsStream.setError(e);
    }
  }

  fetchOtherCars() async {
    try {
      otherCarsStream.setData(null);
      final response = await usecase.fetchCars(
          CarFilterParams(startYear: 1900, endYear: DateTime.now().year - 1));
      otherCarsStream.setData(response);
    } catch (e) {
      otherCarsStream.setError(e);
    }
  }

  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() =>
        favoritesUseCase.toggleFavoriteCar(AddToFavoriteParams(carId: id)));
  }

  Future<List<Car>> fetchCarsBySearch(String search) async {
    return await usecase.fetchCars(CarFilterParams(search: search));
  }
}

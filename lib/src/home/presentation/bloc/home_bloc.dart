import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/domain/use_cases/plates_usecase.dart';
import '../../data/models/car_filter_params.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/car.dart';
import '../../domain/entities/slide.dart';
import '../../domain/use_cases/home_usecase.dart';

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  final PlatesUseCase platesUseCase;

  HomeCubit(this.usecase, this.favoritesUseCase, this.platesUseCase);

  StreamStateInitial<List<Slide>?> slidesStream = StreamStateInitial();
  StreamStateInitial<List<Brand>?> brandsStream = StreamStateInitial();
  StreamStateInitial<List<Car>?> yourCarsStream = StreamStateInitial();
  StreamStateInitial<List<Plate>?> otherCarsStream = StreamStateInitial();

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
  //  await fetchBrands();
    await fetchYourCars();
   await fetchOtherCars();
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
    try { // CarFilterParams(startYear: DateTime.now().year)
      final response = await usecase.fetchCars(CarFilterParams());
      yourCarsStream.setData(response);
    } catch (e) {
      yourCarsStream.setError(e);
    }
  }


  fetchOtherCars() async {
    try {
      otherCarsStream.setData(null);
      final response = await platesUseCase.fetchPlates();
      otherCarsStream.setData(response);
    } catch (e) {
      otherCarsStream.setError(e);
    }
  }



  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavorite(id),
    );
  }

  Future<List<Car>> fetchCarsBySearch(String search) async {
    return await usecase.fetchCars(CarFilterParams(search: search));
  }
}

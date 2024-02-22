import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/installment/domain/entities/roles.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../plates/data/models/plate_filter_params.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/domain/use_cases/plates_usecase.dart';
import '../../data/models/car_filter_params.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/car.dart';
import '../../domain/entities/slide.dart';
import '../../domain/use_cases/home_usecase.dart';

// For the purpose of this example, we will use a global variable to check if the user is normal user or showroom user
bool isGlobalUser = false;
String useRole = Roles.USER;

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
    isGlobalUser = await HelperMethods.isUser();
    useRole =  await HelperMethods.getUserRole();
    print('isUser $isGlobalUser');
    print('useRole $useRole');
    await fetchYourCars();
   await fetchPlates();

  }

  fetchSlides() async {
    slidesStream.setData(null);
    try {
      final response = await usecase.fetchSliders();
      slidesStream.setData(response);
    } catch (e) {
      slidesStream.setError(e);
      // rethrow;
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
      yourCarsStream.setData(response.data?.map((e) => Car.fromDto(e)).toList());
    } catch (e) {
      yourCarsStream.setError(e);
    }
  }


  fetchPlates() async {
    try {
      otherCarsStream.setData(null);
      final response = await platesUseCase.fetchPlates(PlateFilterParams());
      final data = response.data?.map((e) => Plate.fromDto(e)).toList();
      otherCarsStream.setData(data);
    } catch (e) {
      otherCarsStream.setError(e);
    }
  }

  Future<void> toggleFavorite(int id) async {
    executeEmitterListener(() =>
        favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(carId: id)),  onSuccess: (v) async {
      await fetchYourCars();
    });
  }

  Future<void> toggleFavoritePlate(int id) async {
    executeEmitterListener(() => favoritesUseCase.toggleFavoriteCarOrPlate(AddToFavoriteParams(plateId: id),),  onSuccess: (v) async {
      await fetchPlates();
    });
  }

  Future<List<Car>> fetchCarsBySearch(String search) async {
    final data=  await usecase.fetchCars(CarFilterParams(search: search));
    return data.data?.map((e) => Car.fromDto(e)).toList() ?? [];
  }
}

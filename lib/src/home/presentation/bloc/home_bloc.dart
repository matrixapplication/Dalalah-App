import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/installment/domain/entities/roles.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../favorites_and_ads/data/models/add_to_favorite_params.dart';
import '../../../favorites_and_ads/domain/use_cases/favorites_usecase.dart';
import '../../../plates/data/models/plate_filter_params.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/domain/use_cases/plates_usecase.dart';
import '../../../real_estate/data/models/real_estate_model.dart';
import '../../../real_estate/data/models/real_estate_params.dart';
import '../../../real_estate/domain/use_cases/real_estate_usecase.dart';
import '../../data/models/car_filter_params.dart';
import '../../data/models/slide_dto.dart';
import '../../domain/entities/brand.dart';
import '../../domain/entities/car.dart';
import '../../domain/entities/slide.dart';
import '../../domain/use_cases/home_usecase.dart';

// For the purpose of this example, we will use a global variable to check if the user is normal user or showroom user
bool isGlobalUser = false;
String globalUseRole = Roles.USER;

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeUseCase usecase;
  final FavoritesUseCase favoritesUseCase;
  final PlatesUseCase platesUseCase;
  final RealEstateUseCase realEstateUseCase;

  HomeCubit(this.usecase, this.favoritesUseCase, this.platesUseCase, this.realEstateUseCase);

  StreamStateInitial<List<Slide>?> slidesStream = StreamStateInitial();
  StreamStateInitial<List<Brand>?> brandsStream = StreamStateInitial();
  StreamStateInitial<List<Car>?> yourCarsStream = StreamStateInitial();
  StreamStateInitial<List<Plate>?> otherCarsStream = StreamStateInitial();
  StreamStateInitial<RealEstatesModel?> realEstatesStream = StreamStateInitial();

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
    globalUseRole =  await HelperMethods.getUserRole();
    print('isUser $isGlobalUser');
    print('useRole $globalUseRole');
    await fetchYourCars();
    await fetchPlates();
    await fetchRealEstates();

  }
  List<SlideDto>? slideDto=[];
  List<Slide>? sliders=[];

  fetchSlides() async {
    slideDto = await HelperMethods.getSliders();
    try {
      if(slideDto != null){
        sliders =slideDto!.map((e) => Slide.fromDto(e)).toList();
        slidesStream.setData(sliders);
        await usecase.fetchSliders();
      }else{
        sliders = await usecase.fetchSliders();
        slidesStream.setData(sliders);
        }
    } catch (e) {
      slidesStream.setError(e);
    }
  }

  // fetchSlides() async {
  //   slidesStream.setData(null);
  //   try {
  //
  //     final response = await usecase.fetchSlidersCash();
  //     slidesStream.setData(response);
  //   } catch (e) {
  //     slidesStream.setError(e);
  //     // rethrow;
  //   }
  // }

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
    // final carCash = await HelperMethods.getCars();
    // try {
    //   if(carCash != null){
    //     final cars =carCash.map((e) => Car.fromDto(e)).toList();
    //     yourCarsStream.setData(cars);
    //     await usecase.fetchCars(CarFilterParams());
    //   }else{
    //     final response = await usecase.fetchCars(CarFilterParams());
    //     yourCarsStream.setData(response.data?.map((e) => Car.fromDto(e)).toList());
    //   }
    // } catch (e) {
    //   yourCarsStream.setError(e);
    // }
     yourCarsStream.setData(null);

   try { // CarFilterParams(startYear: DateTime.now().year)
      final response = await usecase.fetchCars(CarFilterParams());
      yourCarsStream.setData(response.data?.map((e) => Car.fromDto(e)).toList());
    } catch (e) {
      yourCarsStream.setError(e);
    }
  }


  fetchPlates() async {
    // otherCarsStream.setData(null);
    // final platesCash = await HelperMethods.getPlates();
    // try {
    //   if(platesCash != null){
    //     final plates =platesCash.map((e) => Plate.fromDto(e)).toList();
    //     otherCarsStream.setData(plates);
    //     await platesUseCase.fetchPlates(PlateFilterParams());
    //   }else{
    //     final response = await platesUseCase.fetchPlates(PlateFilterParams());
    //     final data = response.data?.map((e) => Plate.fromDto(e)).toList();
    //     otherCarsStream.setData(data);
    //   }
    // } catch (e) {
    //   otherCarsStream.setError(e);
    // }

    otherCarsStream.setData(null);

    try { // CarFilterParams(startYear: DateTime.now().year)
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
  fetchRealEstates() async {

    // final propertiesCash = await HelperMethods.getProperties();
    // try {
    //   if(propertiesCash != null){
    //     final properties =propertiesCash;
    //     realEstatesStream.setData(properties);
    //     await realEstateUseCase.fetchRealEstates(RealEstateParams());
    //   }else{
    //     final response = await realEstateUseCase.fetchRealEstates(RealEstateParams());
    //     realEstatesStream.setData(response);
    //   }
    // } catch (e) {
    //   realEstatesStream.setError(e);
    // }
    realEstatesStream.setData(null);
    try {
      RealEstateParams params =RealEstateParams();
      final response = await realEstateUseCase.fetchRealEstates(params);
      realEstatesStream.setData(response);
    } catch (e) {
      realEstatesStream.setError(e);
      // rethrow;
    }
  }

}

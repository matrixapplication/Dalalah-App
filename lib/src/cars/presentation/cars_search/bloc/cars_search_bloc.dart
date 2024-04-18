import 'package:dalalah/src/main_index.dart';
import 'package:injectable/injectable.dart';

import '../../../../sell_car/domain/entities/brand_model.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import 'cars_search_state.dart';

@Injectable()
class CarsSearchCubit extends BaseCubit {
  final SellCarUseCase usecase;

  CarsSearchCubit(this.usecase);

  StreamStateInitial<List<BrandModel>?> brandModelsStream = StreamStateInitial();
  fetchInitialData() async {
    emit(DataLoading());
    try {

      final brands = await usecase.fetchBrands();
      final years = await usecase.fetchYears();
      final driveTypes = await usecase.fetchDriveTypes();
      final cities = await usecase.fetchCities();
      // driveTypes.insert(0, DriveType(name: strings.all, key: ''));
      final fuelTypes = await usecase.fetchFuelTypes();
      // fuelTypes.insert(0, FuelType(name: strings.all, key: ''));
      emit(
        CarsSearchState(
          carStatuses: CarStatus.getCarStatuses(),
          brands: brands,
          years: years,
          driveTypes: driveTypes,
          fuelTypes: fuelTypes,
          cities: cities,
          brandModelsStream: brandModelsStream,
        ),
      );
    } on Exception catch (e) {
      emit(DataFailed(e));
    }
  }


  void fetchBrandModels(int id) async{
    brandModelsStream.setData(null);
    try {
      final models = await usecase.fetchBrandModels(id);
      brandModelsStream.setData(models);
    } catch (e) {
      brandModelsStream.setError(e);
    }
  }
}

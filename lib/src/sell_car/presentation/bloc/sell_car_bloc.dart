
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/use_cases/sell_car_usecase.dart';
import 'sell_car_state.dart';

@Injectable()
class SellCarCubit extends BaseCubit {
  final SellCarUseCase usecase;

  SellCarCubit(this.usecase);

  StreamStateInitial<List<DropDownItem>> brandsModelsStream =
  StreamStateInitial<List<DropDownItem>>();
  StreamStateInitial<List<DropDownItem>> brandsModelsExtensionStream =
  StreamStateInitial<List<DropDownItem>>();
  StreamStateInitial<List<DropDownItem>> districtsStream =
  StreamStateInitial<List<DropDownItem>>();

  Future<void> sellCar(SellCarParams params) async {
    executeEmitterListener(() =>
    (params.id == null || params.id == 0)
        ? usecase.sellCar(params)
        : usecase.editCar(params)
    );
  }


  fetchFirstInitialData() async {
    emit(DataLoading());
    try {

      final carStatuses = await usecase.fetchCarStatuses();
      final brands = await usecase.fetchBrands();
      final years = await usecase.fetchYears();
      // final driveTypes = await usecase.fetchDriveTypes();
      // final bodyTypes = await usecase.fetchBodyTypes();
      // final fuelTypes = await usecase.fetchFuelTypes();
   //   final engines = await usecase.fetchCarEngines();
   //    final ports = await usecase.fetchPorts();
   //    final carCountries = await usecase.fetchCarCountries();
   //    final carTypes = await usecase.fetchCarTypes();
   //    final colors = await usecase.fetchColors();
      //    final cities = await usecase.fetchCities();
      //    final features = await usecase.fetchFeatures();
 //     final settingsPrice = await usecase.fetchSettingsPrice();

      emit(
        FirstPageSellCarState(
          carStatuses: carStatuses,
          brands: brands,
          years: years,
          // driveTypes: driveTypes,
          // bodyTypes: bodyTypes,
          // fuelTypes: fuelTypes,
          // engines: engines,
          // ports: ports,
          // carStatuses: carStatuses,
          // carCountries: carCountries,
          // carTypes: carTypes,
          // colors: colors,
          // cities: cities,
          // features: features,
     //     settingsPrice: settingsPrice,
          brandsModelsStream: brandsModelsStream,
          brandsModelsExtensionStream: brandsModelsExtensionStream,
          // districtsStream: districtsStream,
        ),
      );
    } on Exception catch (e) {
      emit(DataFailed(e));
    }
  }

  fetchBrandModels(int id) async {
    try {
      final brands = await usecase.fetchBrandModels(id);
      final dropDownItems = brands
          .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
          .toList();
      brandsModelsStream.setData(dropDownItems);
    } on Exception catch (e) {
      brandsModelsStream.setError(e);
    }
  }

  fetchBrandModelExtensions(int id) async {
    try {
      final brandsModelExtensions = await usecase.fetchBrandModelExtensions(id);
      final dropDownItems = brandsModelExtensions
          .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
          .toList();
      brandsModelsExtensionStream.setData(dropDownItems);
    } on Exception catch (e) {
      brandsModelsExtensionStream.setError(e);
    }
  }



  fetchDistricts(int id) async {
    try {
      final districts = await usecase.fetchDistricts(id);
      final dropDownItems = districts
          .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
          .toList();
      districtsStream.setData(dropDownItems);
    } on Exception catch (e) {
      districtsStream.setError(e);
    }
  }

  fetchFeatures(){
    executeSuccess(() => usecase.fetchFeatures());
  }
}

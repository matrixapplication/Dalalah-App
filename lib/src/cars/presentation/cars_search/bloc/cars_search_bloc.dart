import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../../../sell_car/domain/entities/drive_type.dart';
import '../../../../sell_car/domain/entities/fuel_type.dart';
import '../../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import 'cars_search_state.dart';

@Injectable()
class CarsSearchCubit extends BaseCubit {
  final SellCarUseCase usecase;

  CarsSearchCubit(this.usecase);

  fetchInitialData() async {
    AppLocalizations strings = injector<ServicesLocator>().navigatorKey.currentContext!.strings;
    emit(DataLoading());
    try {

      final brands = await usecase.fetchBrands();
      final years = await usecase.fetchYears();
      final driveTypes = await usecase.fetchDriveTypes();
      driveTypes.insert(0, DriveType(name: strings.all, key: ''));
      final fuelTypes = await usecase.fetchFuelTypes();
      fuelTypes.insert(0, FuelType(name: strings.all, key: ''));
      emit(
        CarsSearchState(
          carStatuses: CarStatus.getCarStatuses(),
          brands: brands,
          years: years,
          driveTypes: driveTypes,
          fuelTypes: fuelTypes,
        ),
      );
    } on Exception catch (e) {
      emit(DataFailed(e));
    }
  }
}

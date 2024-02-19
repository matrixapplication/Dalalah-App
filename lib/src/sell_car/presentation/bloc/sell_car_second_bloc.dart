
import 'package:dalalah/src/sell_car/presentation/bloc/sell_car_second_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../home/domain/entities/car.dart';
import '../../data/models/admin_car_params.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/entities/car_status.dart';
import '../../domain/entities/sell_car_args.dart';
import '../../domain/use_cases/sell_car_usecase.dart';

@Injectable()
class SellCarSecondCubit extends BaseCubit {
  final SellCarUseCase usecase;

  SellCarSecondCubit(this.usecase);

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


  fetchInitialData(SellCarArgs args) async {
    SellCarParams params = args.params!;
    emit(DataLoading());
    Car? car = args.car;
    try {
      if(params.status == CarStatus.newCar && car == null) {
        car = await usecase.fetchAdminCar(AdminCarParams(
          brandId: params.brandId,
          carModelId: params.carModelId,
          carModelExtensionId: params.carModelExtensionId,
          year: params.year,
        ));
      }
        final brands = await usecase.fetchBrands();
        final dropDownItems = brands
            .map((e) => DropDownItem(id: e.id.toString(), title: e.name))
            .toList();
        brandsModelsStream.setData(dropDownItems);
      final driveTypes = await usecase.fetchDriveTypes();
      final bodyTypes = await usecase.fetchBodyTypes();
      final fuelTypes = await usecase.fetchFuelTypes();

      emit(
        SellCarSecondState(
          car: car,
          driveTypes: driveTypes,
          bodyTypes: bodyTypes,
          fuelTypes: fuelTypes,
          engines: [],
          ports: [],
          carCountries: [],
          carTypes: [],
        ),
      );
    } on Exception catch (e) {
      emit(DataFailed(e));
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
}

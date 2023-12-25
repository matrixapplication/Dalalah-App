
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/commen/common_state.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../home/domain/entities/car.dart';
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


  fetchFirstInitialData(Car? car) async {
    emit(DataLoading());
    try {

      final carStatuses = await usecase.fetchCarStatuses();
      final brands = await usecase.fetchBrands();
      final years = await usecase.fetchYears();
      if(car != null){
        await fetchBrandModels(car.brand?.id ?? 0);
        await fetchBrandModelExtensions(car.brandModel?.id ?? 0);
      }

      emit(
        FirstPageSellCarState(
          carStatuses: carStatuses,
          brands: brands,
          years: years,
          brandsModelsStream: brandsModelsStream,
          brandsModelsExtensionStream: brandsModelsExtensionStream,
        ),
      );
    } on Exception catch (e) {
      emit(DataFailed(e));
    }
  }

  fetchBrandModels(int id) async {
    brandsModelsStream.setData([]);
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
    brandsModelsExtensionStream.setData([]);
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

  fetchFeatures(){
    executeSuccess(() => usecase.fetchFeatures());
  }
}

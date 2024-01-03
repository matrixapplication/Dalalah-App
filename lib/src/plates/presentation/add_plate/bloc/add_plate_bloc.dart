import 'package:dalalah/src/sell_car/domain/use_cases/sell_car_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../data/models/add_plate_params.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class AddPlateCubit extends BaseCubit {
  final PlatesUseCase usecase;
  final SellCarUseCase sellCar;

  AddPlateCubit(this.usecase, this.sellCar);

  addPlate(AddPlateParams params) async {
    executeEmitterListener(() => usecase.addPlate(params));
  }


  fetchCities() async {
    executeSuccess(() => sellCar.fetchCities());
  }

  fetchAdFeature() async {
    executeSuccess(() => usecase.fetchAdFeature());
  }

}

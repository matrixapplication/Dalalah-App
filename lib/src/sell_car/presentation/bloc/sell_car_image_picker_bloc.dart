
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/sell_car_params.dart';
import '../../domain/use_cases/sell_car_usecase.dart';

@Injectable()
class SellCarImagePickerCubit extends BaseCubit {
  final SellCarUseCase usecase;

  SellCarImagePickerCubit(this.usecase);


  Future<void> sellCar(SellCarParams params) async {
    ProfileDto? profile = await HelperMethods.getProfile();
    // The modelId is the id of the user who is selling the car
    params.modelId = profile!.id;
    params.modelRole = profile.role;
    executeEmitterListener(() =>
    (params.id == null || params.id == 0)
        ? usecase.sellCar(params)
        : usecase.editCar(params)
    );
  }

  Future<void> fetchInitialData() async {
    executeSuccess(() => usecase.fetchSettingsPrice());
  }
}

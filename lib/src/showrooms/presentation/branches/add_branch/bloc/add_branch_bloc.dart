import 'package:dalalah/core/bloc/base_cubit.dart';
import 'package:dalalah/core/commen/common_state.dart';
import 'package:dalalah/src/sell_car/domain/entities/district.dart';
import 'package:dalalah/src/sell_car/domain/use_cases/sell_car_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/models/add_branch_params.dart';
import '../../../../domain/use_cases/showrooms_usecase.dart';

@Injectable()
class AddBranchCubit extends BaseCubit {
  final ShowroomsUseCase useCase;
  final SellCarUseCase sellCarUseCase;
  AddBranchCubit(this.useCase, this.sellCarUseCase) : super();

  StreamStateInitial<List<District>> districtsStream = StreamStateInitial();

  void fetchCities() {
    executeSuccess(() => sellCarUseCase.fetchCities());
  }

  Future<void> fetchDistricts(int cityId) async {
    districtsStream.setData([]);
    try {
      final districts = await sellCarUseCase.fetchDistricts(cityId);
      districtsStream.setData(districts);
    } catch (e) {
      districtsStream.setError(e);
    }
  }

  void addBranch(AddBranchParams params) {
    executeEmitterListener(() => params.id == null ? useCase.addBranch(params) : useCase.editBranch(params));
  }
}

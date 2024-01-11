import 'package:dalalah/src/sell_car/domain/use_cases/sell_car_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/add_support_params.dart';
import '../../domain/use_cases/settings_usecase.dart';

@Injectable()
class SupportCubit extends BaseCubit {
  final SettingsUseCase usecase;

  SupportCubit(this.usecase);

  void fetchCities() async {
    executeSuccess(() => usecase.fetchContactUs());
  }

  void addSupport(AddSupportParams params) async {
    executeEmitterListener(() => usecase.addSupport(params));
  }

}


import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/use_cases/sell_car_usecase.dart';

@Injectable()
class SellCarPropertiesCubit extends BaseCubit {
  final SellCarUseCase usecase;

  SellCarPropertiesCubit(this.usecase);

  fetchFeatures(){
    executeSuccess(() => usecase.fetchFeatures());
  }
}

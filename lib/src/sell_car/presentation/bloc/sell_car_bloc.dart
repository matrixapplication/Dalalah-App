import 'package:injectable/injectable.dart';
import 'package:arabitac/core/resources/data_state.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/shipment.dart';
import '../../domain/use_cases/sell_car_usecase.dart';

@Injectable()
class SellCarCubit extends BaseCubit {
  final SellCarUseCase usecase;

  SellCarCubit(this.usecase);

  fetchShipments(int type) async {
    try {
      emit(LoadingStateListener());
   // final shipments = await usecase.fetchShipments();
      emit(DataSuccess<List<Shipment>>([]));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }

}

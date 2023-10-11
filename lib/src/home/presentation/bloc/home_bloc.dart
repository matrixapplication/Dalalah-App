import 'package:injectable/injectable.dart';
import 'package:delala/core/resources/data_state.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/shipment_qr_code.dart';
import '../../domain/use_cases/home_usecase.dart';

@Injectable()
class HomeCubit extends BaseCubit {
  final HomeUseCase usecase;

  HomeCubit(this.usecase);

  fetchClientStatus() async {
    try {
      emit(LoadingStateListener());
 //    final status = await usecase.fetchClientStatus();
      emit( DataSuccess(true));
    }  catch (e) {
      print('error $e');
      emit(FailureStateListener(e));
    }
  }

  reasonForDisconnection(String reason) async {
    try {
      emit(LoadingStateListener());
     final response = await usecase.reasonForDisconnection(reason);
      emit(const DataSuccess(''));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }

  scanToReceive(String id) async {
    try {
      emit(LoadingStateListener());
      final response = await usecase.scanToReceive(id);
      emit(DataSuccess<List<ShipmentQRCode>>(response));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }

  scanToPick(String id) async {
    try {
      emit(LoadingStateListener());
     final response = await usecase.scanToPick(id);
      emit( DataSuccess<List<ShipmentQRCode>>(response));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }


}

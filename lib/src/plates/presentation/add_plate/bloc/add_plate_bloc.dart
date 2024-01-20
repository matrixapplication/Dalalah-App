import 'dart:convert';

import 'package:dalalah/src/sell_car/domain/use_cases/sell_car_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../payment/data/models/featured_payment_params.dart';
import '../../../../payment/domain/entities/payment_requests.dart';
import '../../../../payment/domain/use_cases/payment_usecase.dart';
import '../../../data/models/add_plate_params.dart';
import '../../../domain/entities/ad_types.dart';
import '../../../domain/use_cases/plates_usecase.dart';

@Injectable()
class AddPlateCubit extends BaseCubit {
  final PlatesUseCase usecase;
  final SellCarUseCase sellCar;
  final PaymentUseCase paymentUseCase;

  AddPlateCubit(this.usecase, this.sellCar, this.paymentUseCase);

  addPlate(AddPlateParams params) async {
    emit(LoadingStateListener());
  FeaturedPaymentParams logParams = FeaturedPaymentParams();
  dynamic idOrMsg = 0;
  try {

    idOrMsg = await usecase.addPlate(params);
    if(params.adType == AdTypes.featured){
      final data = await PaymentRequests.urWayPayment(
          id: idOrMsg.toString(), amount: params.price.toString());
      print('Result in Main is $data');
      logParams =
          FeaturedPaymentParams.fromJson(jsonDecode(data));
      logParams.adId = idOrMsg;
      logParams.adType = AdTypes.car;
      idOrMsg = await paymentUseCase.addFeaturedPaymentAd(logParams);
    }
    emit(SuccessStateListener<String>(idOrMsg));
  } catch (e) {
    emit(FailureStateListener(e));
    rethrow;
  }
  }


  fetchCities() async {
    executeSuccess(() => sellCar.fetchCities());
  }

  fetchAdFeature() async {
    executeSuccess(() => usecase.fetchAdFeature());
  }

}

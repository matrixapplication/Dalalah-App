import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../payment/data/models/featured_payment_params.dart';
import '../../../../payment/domain/entities/payment_requests.dart';
import '../../../../payment/domain/use_cases/payment_usecase.dart';
import '../../../../plates/domain/use_cases/plates_usecase.dart';

@Injectable()
class AddPremiumADCubit extends BaseCubit {
  final PaymentUseCase paymentUseCase;
  final PlatesUseCase platesUseCase;

  AddPremiumADCubit(this.paymentUseCase, this.platesUseCase);

  Future<void> addFeaturedPaymentAd(int id, String price, String type) async {
    emit(LoadingStateListener());
    FeaturedPaymentParams logParams = FeaturedPaymentParams();
    try {
         final data = await PaymentRequests.urWayPayment(
            id: id.toString(), amount: price);
         logParams =
        FeaturedPaymentParams.fromJson(jsonDecode(data));
        logParams.adId = id;
        logParams.adType = type;
        String message = await paymentUseCase.addFeaturedPaymentAd(logParams);
      emit(SuccessStateListener<String>(message));
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }

  void fetchAdFeature() async {
    executeSuccess(() => platesUseCase.fetchAdFeature());
  }
}

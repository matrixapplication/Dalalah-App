import 'dart:convert';

import 'package:dalalah/core/di/injector.dart';
import 'package:dalalah/core/exceptions/api_exception.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/base_cubit.dart';
import '../../../../../core/resources/data_state.dart';
import '../../../../payment/data/models/featured_payment_params.dart';
import '../../../../payment/data/models/payment_status_dto.dart';
import '../../../../payment/domain/entities/payment_requests.dart';
import '../../../../payment/domain/use_cases/payment_usecase.dart';
import '../../../../plates/domain/entities/ad_feature.dart';
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
     PaymentStatusDto paymentStatusDto = await paymentUseCase.fetchPaymentStatus();
      if(paymentStatusDto.isHide == false){
        final data = await PaymentRequests.urWayPayment(
            id: id.toString(), amount: price);
        logParams =
            FeaturedPaymentParams.fromJson(jsonDecode(data));
        logParams.adId = id;
        logParams.adType = type;
        String message = await paymentUseCase.addFeaturedPaymentAd(logParams);
        emit(SuccessStateListener<String>(message));
      } else {
        final strings = injector<ServicesLocator>().strings;
        emit(FailureStateListener(ApiException(strings.payment_disabled_msg, 0)));
      }
    } catch (e) {
      emit(FailureStateListener(e));
      rethrow;
    }
  }


  fetchAdFeature() {
    executeBuilder(() => paymentUseCase.fetchPaymentStatus(), onSuccess: (data)  async {
      if(data.isHide = true){
        emit(const DataSuccess<AdFeature?>(null));
      } else{
        final data2 = await platesUseCase.fetchAdFeature();
        emit(DataSuccess<AdFeature?>(data2));
      }
    });
  }
}

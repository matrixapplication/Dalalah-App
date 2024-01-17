import 'dart:convert';
import 'package:injectable/injectable.dart';

import '../../../main_index.dart';
import '../../data/models/featured_payment_params.dart';
import '../../data/models/payment_log_params.dart';
import '../../domain/entities/package.dart';
import '../../domain/entities/payment_requests.dart';
import '../../domain/use_cases/payment_usecase.dart';

@Injectable()
class PaymentBloc extends BaseCubit {
  final PaymentUseCase usecase;

  PaymentBloc(this.usecase);

  StreamStateInitial<int?> installmentValueStream = StreamStateInitial();

  void fetchPackages() {
    executeSuccess(() => usecase.fetchPackages());
  }

  void addFeaturedPaymentAd(FeaturedPaymentParams params) {
    executeEmitterListener(() => usecase.addFeaturedPaymentAd(params));
  }

  Future<void> makePayment(Package package) async {
    emit(LoadingStateListener());
    try {
      // initiate payment
      final data = await PaymentRequests.urWayPayment(
          id: package.id.toString(), amount: package.price.toString());
      print('Result in Main is $data');
      PaymentLogParams params = PaymentLogParams.fromJson(jsonDecode(data));
      params.packageId = package.id;
      final msg = await usecase.selectPackagePayment(params);
      emit(SuccessStateListener<String>(msg));
    } catch (e) {
      // Error in platform
      print('Error in platform $e');
      emit(FailureStateListener('Payment Failed'));
      rethrow;
    }
  }
}

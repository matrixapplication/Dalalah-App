
import '../../data/models/featured_payment_params.dart';
import '../../data/models/package_dto.dart';
import '../../data/models/payment_log_params.dart';
import '../../data/models/payment_status_dto.dart';

abstract class BasePaymentRepo<T>{
  Future<List<PackageDto>> fetchPackages();
  Future<String> addFeaturedPaymentAd(FeaturedPaymentParams params);
  Future<String> selectPackagePayment(PaymentLogParams params);
  Future<PaymentStatusDto> fetchPaymentStatus();
}

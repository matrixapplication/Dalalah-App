
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_payment_repo.dart';
import '../data_sources/payment_datasource.dart';
import '../models/featured_payment_params.dart';
import '../models/package_dto.dart';
import '../models/payment_log_params.dart';


@Injectable(as: BasePaymentRepo)
class PaymentRepo extends BasePaymentRepo{
  final PaymentDataSource  apiProvider;
  PaymentRepo(this.apiProvider);

  @override
  Future<List<PackageDto>> fetchPackages() async{
    final data = await apiProvider.fetchPackages();
    return data.data ?? [];
  }

  @override
  Future<String> addFeaturedPaymentAd(FeaturedPaymentParams params) async{
    final data = await apiProvider.addFeaturedPaymentAd(params);
    return data.message ?? '';
  }

  @override
  Future<String> selectPackagePayment(PaymentLogParams params) async{
    final data = await apiProvider.selectPackagePayment(params);
    return data.message ?? '';
  }


}
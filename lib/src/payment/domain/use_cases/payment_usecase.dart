import 'package:injectable/injectable.dart';

import '../../data/models/featured_payment_params.dart';
import '../../data/models/payment_log_params.dart';
import '../entities/package.dart';
import '../repositories/base_payment_repo.dart';



@Injectable()
class PaymentUseCase {
  final BasePaymentRepo repository ;
  PaymentUseCase(this.repository);

  Future<List<Package>> fetchPackages() async{
    final data = await repository.fetchPackages();
    return data.map((e) => Package.fromDto(e)).toList();
  }

  Future<String> addFeaturedPaymentAd(FeaturedPaymentParams params) async{
    return await repository.addFeaturedPaymentAd(params);
  }

  Future<String> selectPackagePayment(PaymentLogParams params) async{
    return await repository.selectPackagePayment(params);
  }

}
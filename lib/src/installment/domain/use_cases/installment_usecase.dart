import 'package:injectable/injectable.dart';

import '../repositories/base_installment_repo.dart';



@Injectable()
class InstallmentUseCase {
  final BaseInstallmentRepo repository ;
  InstallmentUseCase(this.repository);

  Future<String> fetchInstallment() async{
    final data = await repository.fetchInstallment();
    return '';
  }

  Future<String> fetchInstallmentValue(String data) async{
   // final data = await repository.fetchInstallmentValue(data);
    return '5000';
  }

}
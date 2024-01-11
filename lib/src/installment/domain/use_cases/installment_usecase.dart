import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../data/models/installment_calculation_params.dart';
import '../../data/models/installment_cars_params.dart';
import '../repositories/base_installment_repo.dart';



@Injectable()
class InstallmentUseCase {
  final BaseInstallmentRepo repository ;
  InstallmentUseCase(this.repository);

  Future<int> fetchInstallmentValue(InstallmentCalculationParams params) async{
    final data = await repository.fetchInstallmentValue(params);
    return data;
  }

  Future<ApiResponse<List<CarDto>>> filterCarsByInstallment(InstallmentCarsParams params) async{
    return await repository.filterCarsByInstallment(params);
  }

}

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../data/models/installment_calculation_params.dart';
import '../../data/models/installment_cars_params.dart';


abstract class BaseInstallmentRepo<T>{
  Future<int> fetchInstallmentValue(InstallmentCalculationParams params);
  Future<ApiResponse<List<CarDto>>> filterCarsByInstallment(InstallmentCarsParams params);
}

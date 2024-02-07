
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../home/data/models/car_dto.dart';
import '../../domain/repositories/base_installment_repo.dart';
import '../data_sources/installment_datasource.dart';
import '../models/installment_calculation_params.dart';
import '../models/installment_cars_params.dart';


@Injectable(as: BaseInstallmentRepo)
class InstallmentRepo extends BaseInstallmentRepo{
  final InstallmentDataSource  apiProvider;
  InstallmentRepo(this.apiProvider);


  @override
  Future<int> fetchInstallmentValue(InstallmentCalculationParams params) async{
    final data = await apiProvider.fetchInstallmentValue(params);
    return data.data ?? 0;
  }

  @override
  Future<ApiResponse<List<CarDto>>> filterCarsByInstallment(InstallmentCarsParams params) async{
    return await apiProvider.filterCarsByInstallment(params);
  }


}
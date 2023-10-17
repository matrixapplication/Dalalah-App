
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/register_params.dart';
import '../../domain/repositories/base_installment_repo.dart';
import '../data_sources/installment_datasource.dart';
import '../models/profile_dto.dart';


@Injectable(as: BaseInstallmentRepo)
class InstallmentRepo extends BaseInstallmentRepo{
  final InstallmentDataSource  apiProvider;
  InstallmentRepo(this.apiProvider);

  @override
  Future<String> fetchInstallment() async{
    final response = await apiProvider.fetchInstallment();
    return 'response.data!';
  }


}
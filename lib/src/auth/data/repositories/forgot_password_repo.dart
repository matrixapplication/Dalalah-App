
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_forgot_password_repo.dart';
import '../data_sources/forgot_password_datasource.dart';
import '../models/forgot_password_params.dart';
import '../models/register_params.dart';

@Injectable(as: BaseForgotPasswordRepo)
class ForgotPasswordRepo extends BaseForgotPasswordRepo{
  final ForgotPasswordDataSource  apiProvider;
  ForgotPasswordRepo(this.apiProvider);

  @override
  Future<String> resetPassword(RegisterParams params) async{
    final response = await apiProvider.resetPassword(params);
    return response.data!;
  }

  @override
  Future<String> enterCode(String code) async{
    final response = await apiProvider.enterCode(code);
    return response.data!;
  }

  @override
  Future<String> forgotPassword(ForgotPasswordParams params) async{
    final response = await apiProvider.forgotPassword(params);
    return response.data!;
  }
}
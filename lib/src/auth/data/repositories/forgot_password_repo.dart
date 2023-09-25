
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_forgot_password_repo.dart';
import '../data_sources/forgot_password_datasource.dart';
import '../models/forgot_password_params.dart';

@Injectable(as: BaseForgotPasswordRepo)
class ForgotPasswordRepo extends BaseForgotPasswordRepo{
  final ForgotPasswordDataSource  apiProvider;
  ForgotPasswordRepo(this.apiProvider);

  @override
  Future<String> enterPhoneNumber(String phoneNumber) async{
    final response = await apiProvider.enterPhoneNumber(phoneNumber);
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
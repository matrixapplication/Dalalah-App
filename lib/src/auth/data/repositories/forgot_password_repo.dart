
import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_forgot_password_repo.dart';
import '../data_sources/forgot_password_datasource.dart';
import '../models/forgot_password_params.dart';
import '../models/password_otp_params.dart';
import '../models/register_params.dart';
import '../models/verify_password_otp_params.dart';

@Injectable(as: BaseForgotPasswordRepo)
class ForgotPasswordRepo extends BaseForgotPasswordRepo{
  final ForgotPasswordDataSource  apiProvider;
  ForgotPasswordRepo(this.apiProvider);

  @override
  Future<String> generateOTP(PasswordOTPParams params) async{
    final response = await apiProvider.generateOTP(params);
    return response.message.toString();
  }

  @override
  Future<String> verifyPasswordOTP(VerifyPasswordOTPParams params) async{
    final response = await apiProvider.verifyPasswordOTP(params);
    return response.message.toString();
  }

  @override
  Future<String> forgotPassword(ForgotPasswordParams params) async{
    final response = await apiProvider.forgotPassword(params);
    return response.data!;
  }
}
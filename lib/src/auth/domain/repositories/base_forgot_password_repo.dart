
import '../../data/models/forgot_password_params.dart';
import '../../data/models/register_params.dart';



abstract class BaseForgotPasswordRepo {
  Future<String> resetPassword(RegisterParams params);
  Future<String> enterCode(String code);
  Future<String> forgotPassword(ForgotPasswordParams params);
}

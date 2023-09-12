
import '../../data/models/forgot_password_params.dart';



abstract class BaseForgotPasswordRepo {
  Future<String> enterPhoneNumber(String phoneNumber);
  Future<String> enterCode(String code);
  Future<String> forgotPassword(ForgotPasswordParams params);
}

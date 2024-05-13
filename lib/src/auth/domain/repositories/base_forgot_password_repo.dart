
import '../../data/models/forgot_password_params.dart';
import '../../data/models/password_otp_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/verify_password_otp_params.dart';



abstract class BaseForgotPasswordRepo {
  Future<String> generateOTP(PasswordOTPParams params);
  Future<String> verifyPasswordOTP(VerifyPasswordOTPParams params);
  Future<String> forgotPassword(ForgotPasswordParams params);
}

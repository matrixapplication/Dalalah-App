import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/forgot_password_params.dart';
import '../../data/models/password_otp_params.dart';
import '../../data/models/verify_password_otp_params.dart';
import '../repositories/base_forgot_password_repo.dart';

@Injectable()
class ForgotPasswordUseCase {
  final BaseForgotPasswordRepo repository ;
  ForgotPasswordUseCase(this.repository);

  Future<String> generateOTP(PasswordOTPParams params) async{
    return repository.generateOTP(params);
  }

  Future<String> verifyPasswordOTP(VerifyPasswordOTPParams params) async {
    return repository.verifyPasswordOTP(params);
  }

  Future<String> forgotPassword(ForgotPasswordParams params) {
    return repository.forgotPassword(params);
  }

}
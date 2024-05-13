import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../data/models/forgot_password_params.dart';
import '../../data/models/password_otp_params.dart';
import '../../data/models/verify_password_otp_params.dart';
import '../../domain/use_cases/forgot_password_usecase.dart';

@Injectable()
class ForgotPasswordCubit extends BaseCubit {
  final ForgotPasswordUseCase usecase;

  ForgotPasswordCubit(this.usecase);


  enterPhoneNumber(PasswordOTPParams params) async {
    executeEmitterListener(() => usecase.generateOTP(params));
  }
  verifyPasswordOTP(VerifyPasswordOTPParams params) async {
    executeEmitterListener(() => usecase.verifyPasswordOTP(params));
  }



  forgotPassword(ForgotPasswordParams params) async {
    executeEmitterListener(() => usecase.forgotPassword(params));
  }


}

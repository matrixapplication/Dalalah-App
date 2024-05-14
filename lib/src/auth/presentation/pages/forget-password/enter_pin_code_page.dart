import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/password_otp_params.dart';
import '../../../data/models/verify_password_otp_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'enter_pin_code_screen.dart';

class EnterPinCodePage
    extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  EnterPinCodePage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    PasswordOTPParams params = getArguments(context);
    return EnterPinCodeScreen(
      onPinCode: (String code) {
        bloc.verifyPasswordOTP(
          VerifyPasswordOTPParams(
            otp: code,
            modelRole: params.modelRole,
            loginUse: params.loginUse,
          ),
        );
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.newPasswordPage, arguments: getArguments(context!));
  }
}

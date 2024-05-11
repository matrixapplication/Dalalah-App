import 'package:dalalah/core/utils/navigator.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../data/models/forgot_password_params.dart';
import '../../../data/models/password_otp_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'new_password_screen.dart';

class NewPasswordPage extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    PasswordOTPParams params = getArguments(context);
    return NewPasswordScreen(
      onForgotPasswordParams: (String password) {
        bloc.forgotPassword(
          ForgotPasswordParams(
            loginUse: params.loginUse ?? '',
            modelRole: params.modelRole ?? '',
            password: password,
          ),
        );
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.login);
  }
}

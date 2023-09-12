import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'enter_pin_code_screen.dart';

class EnterPinCodePage
    extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  EnterPinCodePage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(
      BuildContext context, UnInitState state) {
    return EnterPinCodeScreen(
      onPinCode: (String code) {
        Navigator.pushNamed(context, Routes.newPasswordPage);
        // bloc.enterPinCode(code);
      },
    );
  }
}

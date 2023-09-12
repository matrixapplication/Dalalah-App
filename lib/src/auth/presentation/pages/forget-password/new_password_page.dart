import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../data/models/forgot_password_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'new_password_screen.dart';

class NewPasswordPage extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return NewPasswordScreen(
      onForgotPasswordParams: (ForgotPasswordParams params) {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.login, (route) => false);
        //bloc.forgotPassword(params);
      },
    );
  }
}

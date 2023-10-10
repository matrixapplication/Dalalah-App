import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/register_params.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_widget.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class RegisterPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AuthWidget(
      child: RegisterScreen(
        onRegister: (RegisterParams params) {
          bloc.register(params);
          //Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
        },
      ),
    );
  }

  @override
  bool? resizeToAvoidBottomInset(BuildContext context) {
    return false;
  }

  @override
  onSuccessDismissed() {
    Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}

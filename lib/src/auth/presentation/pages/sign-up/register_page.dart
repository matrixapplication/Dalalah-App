
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../data/models/register_params.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_app_scaffold.dart';
import '../../widgets/auth_widget.dart';
import 'register_screen.dart';

// ignore: must_be_immutable
class RegisterPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  RegisterPage({Key? key}) : super(key: key);


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AuthAppScaffold(
      child: RegisterScreen(
        onRegister: (RegisterParams params) {
          // bloc.register(params);
          Navigator.pushNamed(context, Routes.navigationPages);
        },
      ),
    );
  }
}

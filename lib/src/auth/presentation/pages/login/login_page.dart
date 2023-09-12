
import 'package:arabitac/core/components/base_widget_bloc.dart';

import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_app_scaffold.dart';
import '../../widgets/auth_widget.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class LoginPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  LoginPage({Key? key}) : super(key: key);


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AuthAppScaffold(
      child: LoginScreen(
        onPressed: (LoginParams params) {
          // bloc.login(params);
          Navigator.pushNamed(context, Routes.navigationPages);
        },
      ),
    );
  }
}

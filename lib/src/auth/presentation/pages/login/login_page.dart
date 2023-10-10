import 'package:arabitac/core/components/base_widget_bloc.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';
import '../../../data/models/showroom_login_params.dart';
import '../../bloc/auth_bloc.dart';
import '../../widgets/auth_widget.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class LoginPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return AuthWidget(
      //  child: Text('Login', style: context.titleLarge),
      child: LoginScreen(
        onLogin: (LoginParams params) {
          bloc.login(params);
        },
        onShowRoomLogin: (LoginParams params) {
          ShowroomLoginParams  roomParams = ShowroomLoginParams(
            code: params.email,
            password: params.password,
          );
          bloc.showRoomLogin(roomParams);
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

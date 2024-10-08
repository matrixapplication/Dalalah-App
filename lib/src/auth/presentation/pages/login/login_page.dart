import 'package:dalalah/core/components/base_widget_bloc.dart';
import '../../../../../core/utils/helper_methods.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';
import '../../../data/models/login_real_estate_developer_params.dart';
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
          print("111111111111");
          bloc.login(params);
        },
        onRealEstateDevelopersLogin: (LoginParams params) {
          LoginRealEstateDeveloperParams developerParams=LoginRealEstateDeveloperParams(
            phone: params.email,
            password: params.password,
          );
          bloc.loginAsRealEstateDeveloper(developerParams);
        },
        onShowRoomLogin: (LoginParams params) {
          ShowroomLoginParams roomParams = ShowroomLoginParams(
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
  onSuccessDismissed() async {
    bool isVerified = await HelperMethods.isVerified();
    isVerified ? pushNamedAndRemoveUntil(Routes.navigationPages) :  pushNamed(Routes.verifyAccountPage);
  }
}

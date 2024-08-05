import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';

import '../../../../installment/domain/entities/roles.dart';
import '../../../../main_index.dart';
import '../../../data/models/password_otp_params.dart';
import '../../../data/models/register_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'enter_phone_number_screen.dart';

class EnterPhoneNumberPage
    extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
  EnterPhoneNumberPage({Key? key}) : super(key: key);

  PasswordOTPParams params = PasswordOTPParams();

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return EnterPhoneNumberScreen(
      type: getArguments(context),
      onEnterPhoneNumber: (String loginUse) {
        String type = getArguments(context);
        params = PasswordOTPParams(
          loginUse: loginUse,
          modelRole: type,
        );
        print('ddddfff ${params.toJson().toString()}');
        bloc.enterPhoneNumber(params);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.enterPinCodePage, arguments: params);
  }
}


import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';

import '../../../../main_index.dart';
import '../../../data/models/register_params.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'enter_phone_number_screen.dart';

class EnterPhoneNumberPage extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
   EnterPhoneNumberPage({Key? key}) : super(key: key);


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return EnterPhoneNumberScreen(
      onEnterPhoneNumber: (String email) {
        String type = getArguments(context);
        bloc.enterPhoneNumber(RegisterParams(email: email, type: type));
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pop();
  }
}

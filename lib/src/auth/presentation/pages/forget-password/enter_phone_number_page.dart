
import 'package:dalalah/core/components/base_widget_bloc.dart';

import '../../../../main_index.dart';
import '../../bloc/forgot_password_bloc.dart';
import 'enter_phone_number_screen.dart';

class EnterPhoneNumberPage extends BaseBlocWidget<UnInitState, ForgotPasswordCubit> {
   EnterPhoneNumberPage({Key? key}) : super(key: key);


  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return EnterPhoneNumberScreen(
      onEnterPhoneNumber: (String email) {
        Navigator.pushNamed(context, Routes.enterPinCodePage, arguments: email);
        // bloc.enterPhoneNumber(phoneNumber);
      },
    );
  }
}

import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/src/auth/presentation/pages/verify-account/send_otp_screen.dart';

import '../../../../installment/domain/entities/profile.dart';
import '../../../../main_index.dart';
import '../../../../profile/domain/entities/profile.dart';
import '../../../data/models/send_otp_params.dart';
import '../../bloc/auth_bloc.dart';


class SendOTPPage extends BaseBlocWidget<DataSuccess<Profile>, AuthCubit> {
  SendOTPPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchProfileDataFromCash();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Profile> state) {
    return SendOTPScreen(
      profile: state.data ?? Profile(),
      onEnterPhoneNumber: (String phone) {
        // bloc.sendOtp(SendOTPParams(phone: phone));
        pushNamed(Routes.verifyAccountPage, arguments: bloc.state.data);
      },
    );
  }

  @override
  void onSuccessDismissed() {
    pushNamed(Routes.verifyAccountPage, arguments: bloc.state.data);
  }
}

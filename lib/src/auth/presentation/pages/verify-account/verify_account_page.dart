import 'package:dalalah/src/auth/data/models/register_params.dart';
import 'package:dalalah/src/auth/presentation/pages/verify-account/verify_account_screen.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../../profile/domain/entities/profile.dart';
import '../../../data/models/send_otp_params.dart';
import '../../../data/models/verify_otp_params.dart';
import '../../bloc/auth_bloc.dart';

class VerifyAccountPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  VerifyAccountPage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.sendOtp();
  // }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    bloc.sendOtp();
    return VerifyAccountScreen(
      onResend: (){
        bloc.sendOtp(isResend: true);
      },
      onPinCode: (String code) {
        bloc.verifyOtp(code);
      },
    );
  }


  @override
  void onSuccessDismissed() {
    pushNamedAndRemoveUntil(Routes.navigationPages);
  }
}

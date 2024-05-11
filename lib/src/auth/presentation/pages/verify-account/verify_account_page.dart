import 'package:dalalah/src/auth/presentation/pages/verify-account/verify_account_screen.dart';

import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../main_index.dart';
import '../../../../profile/domain/entities/profile.dart';
import '../../../data/models/verify_otp_params.dart';
import '../../bloc/auth_bloc.dart';

class VerifyAccountPage extends BaseBlocWidget<UnInitState, AuthCubit> {
  VerifyAccountPage({Key? key}) : super(key: key);

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return VerifyAccountScreen(
      onPinCode: (String code) {
        Profile profile = getArguments(context);
        bloc.verifyOtp(
          VerifyOTPParams(
            otp: code,
            modelId: profile.id?.toString() ?? '0',
            modelRole: profile.role ?? '',
          ),
        );
      },
    );
  }
}

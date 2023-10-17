import '../../../../core/components/base_widget_bloc.dart';
import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../bloc/installment_bloc.dart';
import 'installment_screen.dart';

class InstallmentPage extends BaseBlocWidget<UnInitState, ProfileBloc> {
  InstallmentPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    // bloc.fetchProfileData();
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return InstallmentScreen(
      // profile: state.data!,
      // obRefresh: () => bloc.fetchProfileData(isRefresh: true),
      // onDeleteAccount: () => deleteAccount(),
      // onLogout: () => logout(),
    );
  }

  @override
  onSuccessDismissed() {
    Navigators.pushNamedAndRemoveUntil(Routes.login);
  }
}

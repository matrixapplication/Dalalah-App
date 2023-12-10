import '../../../../core/components/base_widget_bloc.dart';
import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import 'profile_screen.dart';

class ProfilePage extends BaseBlocWidget<DataSuccess<Profile>, ProfileBloc> {
  ProfilePage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
     bloc.fetchProfileData(isRefresh: false);
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Profile> state) {
    return ProfileScreen(
      profile: state.data!,
      onRefresh: () => bloc.fetchProfileData(isRefresh: false),
      onDeleteAccount: () => deleteAccount(),
      onLogout: () => logout(),
    );
  }

  logout() {
    DialogsManager.showInfoDialog(context!, message: strings.logout_description,
        onClickOk: () {
      bloc.logout();
    });
  }

  deleteAccount() {
    DialogsManager.showInfoDialog(context!, message: strings.delete_account_description,
        onClickOk: () {
      bloc.deleteAccount();
    });
  }

  @override
  onSuccessDismissed() {
    Navigators.pushNamedAndRemoveUntil(Routes.login);
  }
}

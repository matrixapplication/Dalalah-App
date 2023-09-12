
import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import 'profile_screen.dart';

class ProfilePage extends BaseBlocWidget<DataSuccess<Profile>, ProfileBloc>{
  ProfilePage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchProfileData();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<Profile> state) {
    return ProfileScreen(
      profile: state.data!,
      onDeleteAccount: () => bloc.deleteProfileData(),
    );
  }

  // @override
  // String? title(BuildContext context) {
  //   return strings.my_account;
  // }
}


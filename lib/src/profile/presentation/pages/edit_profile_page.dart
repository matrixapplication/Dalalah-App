
import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';
import '../bloc/profile_bloc.dart';
import 'edit_profile_screen.dart';
import 'profile_screen.dart';

class EditProfilePage extends BaseBlocWidget<UnInitState, ProfileBloc>{
  EditProfilePage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {
  //   bloc.fetchProfileData();
  // }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return EditProfileScreen(
      profile: Profile(),
      onEdit: () => bloc.deleteProfileData(),
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.edit_profile;
  }
}


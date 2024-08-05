
import '../../../../core/components/base_widget_bloc.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../../core/utils/navigator.dart';
import '../../../main_index.dart';
import '../../../sell_car/domain/entities/city.dart';
import '../../domain/entities/profile.dart';
import '../bloc/edit_profile_bloc.dart';
import '../bloc/profile_bloc.dart';
import 'edit_profile_screen.dart';
import 'profile_screen.dart';

class EditProfilePage extends BaseBlocWidget<DataSuccess<List<City>>, EditProfileBloc>{
  EditProfilePage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCities();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<City>> state) {
    Profile profile = getArguments(context);
    return EditProfileScreen(
      profile: profile,
      cities: state.data ?? [],
      onEdit: (params) => bloc.editProfileData(params),
      onEditImage: (fil) => bloc.editProfileImage(fil),
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.edit_profile;
  }
  @override
  onSuccessDismissed() async {
    bool isVerified = await HelperMethods.isVerified();
    isVerified ? Navigator.pop(context!, true) : pushNamed(Routes.verifyAccountPage);
  }
}


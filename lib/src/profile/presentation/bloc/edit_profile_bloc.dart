import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/register_params.dart';
import '../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/profile_usecase.dart';

@Injectable()
class EditProfileBloc extends BaseCubit {
  final ProfileUseCase usecase;
  final SellCarUseCase sellCarUseCase;

  EditProfileBloc(this.usecase, this.sellCarUseCase);

  deleteAccount() async {
    executeListener(() => usecase.deleteProfileData(), onSuccess: (value) async {
      await HelperMethods.removeProfile();
      emit(SuccessStateListener<String>(value));
    });
  }

  logout() async {
    executeEmitterSuccess(() => HelperMethods.removeProfile());
  }

  editProfileData(RegisterParams params) async {
    bool isShowroom = await HelperMethods.isAdmin();
    executeEmitterListener(() => isShowroom ? usecase.editProfileDataShowroom(params): usecase.editProfileData(params));
  }

  editProfileImage(File file) async {
    bool isShowroom = await HelperMethods.isAdmin();
    executeEmitterListener(() => isShowroom ? usecase.editProfileImageShowroom(file) : usecase.editProfileImage(file));
  }


  void fetchCities() {
    executeSuccess(() => sellCarUseCase.fetchCities());
  }

}

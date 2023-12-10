import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/register_params.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/profile_usecase.dart';

@Injectable()
class ProfileBloc extends BaseCubit {
  final ProfileUseCase usecase;

  ProfileBloc(this.usecase);

  ProfileDto? profileDto = ProfileDto();
  fetchProfileData({bool isRefresh = true}) async {
    emit(DataLoading());
    profileDto = await HelperMethods.getProfile();
    Profile profile = Profile();

    try {
      if(isRefresh == false){
        profile = Profile.fromDto(profileDto ?? ProfileDto(name: 'Guest'));
      }else{
        profile = await usecase.fetchProfileData();
      }
      emit(DataSuccess<Profile>(profile));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }

  deleteAccount() {
    executeListener(() => usecase.deleteProfileData(), onSuccess: (value) async {
      await HelperMethods.removeProfile();
      emit(SuccessStateListener<String>(value));
    });
  }

  logout() async {
    executeEmitterListener(() => HelperMethods.removeProfile());
  }
}

import 'dart:io';

import 'package:arabitac/core/utils/helper_methods.dart';
import 'package:arabitac/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/register_params.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/profile_usecase.dart';

@Injectable()
class ProfileBloc extends BaseCubit {
  final ProfileUseCase usecase;

  ProfileBloc(this.usecase);

  ProfileDto? profileDto = ProfileDto();
  fetchProfileData() async {
    emit(LoadingStateListener());
    profileDto = await HelperMethods.getProfile();
    Profile profile = Profile();

    try {
      if(profileDto?.id != null){
        print('shared ${profile}');
        profile = Profile.fromDto(profileDto!);
      }else{
        print('fetchProfileData ${profile.token}');
        profile = await usecase.fetchProfileData();
        HelperMethods.saveProfile(ProfileDto.fromJson(profile.toJson()));
      }
      emit(DataSuccess<Profile>(profile));
    } catch (e) {
      emit(DataFailed(e));
    }
  }

  deleteProfileData() async {
    executeEmitterListener(() => usecase.deleteProfileData());
  }

  editProfileData(RegisterParams params) async {
    executeEmitterListener(() => usecase.editProfileData(params));
  }

  editProfileImage(File file) async {
    executeEmitterListener(() => usecase.editProfileImage(file));
  }
}

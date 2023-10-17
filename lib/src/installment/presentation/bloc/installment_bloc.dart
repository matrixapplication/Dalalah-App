import 'dart:io';

import 'package:delala/core/utils/helper_methods.dart';
import 'package:delala/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/register_params.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/installment_usecase.dart';

@Injectable()
class ProfileBloc extends BaseCubit {
  final InstallmentUseCase usecase;

  ProfileBloc(this.usecase);

  ProfileDto? profileDto = ProfileDto();
  fetchProfileData({bool? isRefresh}) async {
    emit(DataLoading());
    profileDto = await HelperMethods.getProfile();
    Profile profile = Profile();

    try {
      if(isRefresh != true){
        print('shared ${profile}');
        // profile = Profile.fromDto(profileDto!);
      }else{
        print('fetchProfileData ${profile.token}');

        HelperMethods.saveProfile(ProfileDto.fromJson(profile.toJson()));
      }
      emit(DataSuccess<Profile>(profile));
    } catch (e) {
      emit(FailureStateListener(e));
    }
  }
}

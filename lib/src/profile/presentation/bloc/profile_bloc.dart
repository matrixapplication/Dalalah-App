import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/installment/domain/entities/roles.dart';
import 'package:dalalah/src/payment/data/models/payment_status_dto.dart';
import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/register_params.dart';
import '../../../payment/domain/use_cases/payment_usecase.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/profile_usecase.dart';

@Injectable()
class ProfileBloc extends BaseCubit {
  final ProfileUseCase usecase;
  final PaymentUseCase paymentUseCase;

  ProfileBloc(this.usecase, this.paymentUseCase);

  ProfileDto? profileDto = ProfileDto();
  fetchProfileData({bool isRefresh = true,}) async {
    emit(DataLoading());
    profileDto = await HelperMethods.getProfile();
   bool isRealEstateDeveloper = await HelperMethods.isRealEstateDeveloper();
    Profile profile = Profile();

    try {
      PaymentStatusDto paymentStatusDto = await paymentUseCase.fetchPaymentStatus();
      if(isRefresh == false){
        profile = Profile.fromDto(profileDto ?? ProfileDto(name: 'Guest'));
      }else{
        if(isRealEstateDeveloper==true){
          profile = await usecase.fetchProfileRealEstateDeveloper();

        }else{
          profile = await usecase.fetchProfileData();

        }
      }
      profile.isHidePayment = paymentStatusDto.isHide;
      emit(DataSuccess<Profile>(profile));
    } catch (e) {
      emit(DataFailed(e));
    }
  }

  deleteAccount() {
    executeListener(() => usecase.deleteProfileData(), onSuccess: (value) async {
      await HelperMethods.removeProfile();
      emit(SuccessStateListener<String>(value));
    });
  }

  logout() async {
    executeEmitterSuccess(() => HelperMethods.removeProfile());
  }
}

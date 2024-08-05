import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../../auth/data/models/register_params.dart';
import '../../../sell_car/domain/use_cases/sell_car_usecase.dart';
import '../../domain/use_cases/profile_usecase.dart';

@Injectable()
class EditProfileBloc extends BaseCubit {
  final ProfileUseCase usecase;
  final SellCarUseCase sellCarUseCase;

  EditProfileBloc(this.usecase, this.sellCarUseCase);


  logout() async {
    executeEmitterSuccess(() => HelperMethods.removeProfile());
  }

  editProfileData(RegisterParams params) async {
    bool isShowroom = await HelperMethods.isAdmin();
    bool isRealEstateDeveloper = await HelperMethods.isRealEstateDeveloper();
    if(isRealEstateDeveloper==true){
      executeEmitterListener(() => usecase.editProfileDataRealEstateDeveloper(params));
    }else if(isShowroom==true){
      executeEmitterListener(() => usecase.editProfileDataShowroom(params));
    }else{
      executeEmitterListener(() =>usecase.editProfileData(params));
    }
  }

  editProfileImage(File file) async {
    bool isShowroom = await HelperMethods.isAdmin();
    executeEmitterListener(() => isShowroom ? usecase.editProfileImageShowroom(file) : usecase.editProfileImage(file));
  }


  void fetchCities() {
    executeSuccess(() => sellCarUseCase.fetchCities());
  }

  void editTaxCardShowroom(File file) {
    executeSuccess(() => usecase.editTaxCardShowroom(file));
  }

  void editCommercialImageShowroom(File file) {
    executeSuccess(() => usecase.editCommercialImageShowroom(file));
  }

  void editCoverImageShowroom(File file) {
    executeSuccess(() => usecase.editCoverImageShowroom(file));
  }

}

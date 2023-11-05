import 'dart:io';

import 'package:dalalah/core/commen/common_state.dart';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/installment_usecase.dart';

@Injectable()
class InstallmentBloc extends BaseCubit {
  final InstallmentUseCase usecase;

  InstallmentBloc(this.usecase);

  StreamStateInitial<String?> installmentValueStream = StreamStateInitial();

  ProfileDto? profileDto = ProfileDto();

  fetchProfileData({bool? isRefresh}) async {
    // executeSuccess(() => usecase.fetchC(isRefresh: isRefresh));
  }

  fetchInstallmentValue(String data) async {
    executeListener(() => usecase.fetchInstallmentValue(data),
        onSuccess: (value) {
          installmentValueStream.setData(value);
          emit((SuccessStateListener(value)));
    });
  }
}

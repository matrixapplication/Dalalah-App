import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/entities/profile.dart';
import '../../domain/use_cases/profile_usecase.dart';

@Injectable()
class ProfileBloc extends BaseCubit {
  final ProfileUseCase usecase;

  ProfileBloc(this.usecase);

  fetchProfileData() async {
    emit(DataLoading());
    try {
      final profile = await usecase.fetchProfileData();
      emit(DataSuccess<Profile>(profile));
    } catch (e) {
      emit(DataFailed(e));
    }
  }

  deleteProfileData() async {
    emit(DataLoading());
    try {
      final response = await usecase.deleteProfileData();
      emit(DataSuccess(response));
    } catch (e) {
      emit(DataFailed(e));
    }
  }

  editProfileData() async {
    executeEmitterListener(() => usecase.editProfileData());
  }
}

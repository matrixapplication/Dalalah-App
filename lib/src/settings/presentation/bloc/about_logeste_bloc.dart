import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/use_cases/settings_usecase.dart';

@Injectable()
class AboutLogesteCubit extends BaseCubit {
  final SettingsUseCase usecase;

  AboutLogesteCubit(this.usecase);

  fetchAbout() async {
    try {
      emit(LoadingStateListener());
     final about = await usecase.fetchAbout();
      emit(DataSuccess<String>(about));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }
}

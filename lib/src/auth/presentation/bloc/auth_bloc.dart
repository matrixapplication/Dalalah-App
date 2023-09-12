import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../../../core/resources/data_state.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../domain/use_cases/auth_usecase.dart';

@Injectable()
class AuthCubit extends BaseCubit {
  final AuthUseCase usecase;

  AuthCubit(this.usecase);

  login(LoginParams params) async {
    emit(DataLoading());
    try {
     final response = await usecase.login(params);
      emit(SuccessStateListener(response));
    } catch (e) {
      emit(DataFailed(e));
    }
  }

  register(RegisterParams params) async {
    emit(DataLoading());
    try {
    final response = await usecase.register(params);
      emit( SuccessStateListener(response));
    } catch (e) {
      emit(DataFailed(e));
    }
  }
}

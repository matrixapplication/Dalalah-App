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

  login(LoginParams params)  {
    executeEmitterListener(() => usecase.loginAsUser(params));
  }

  register(RegisterParams params) async {
    executeEmitterListener(() => usecase.register(params));
  }
}

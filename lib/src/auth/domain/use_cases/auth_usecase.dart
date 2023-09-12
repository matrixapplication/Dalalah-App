import 'package:injectable/injectable.dart';

import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../repositories/base_auth_repo.dart';

@Injectable()
class AuthUseCase {
  final BaseAuthRepo repository ;
  AuthUseCase(this.repository);

  Future<String> login(LoginParams params) {
    return repository.login(params);
  }

  Future<String> register(RegisterParams params) {
    return repository.register(params);
  }

}
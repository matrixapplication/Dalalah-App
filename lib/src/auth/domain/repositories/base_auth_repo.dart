
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';


abstract class BaseAuthRepo {
  Future<String> login(LoginParams params);
  Future<String> register(RegisterParams params);
}

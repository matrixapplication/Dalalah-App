
import 'package:injectable/injectable.dart';
import 'package:arabitac/src/auth/data/models/login_params.dart';

import '../../domain/repositories/base_auth_repo.dart';
import '../data_sources/auth_datasource.dart';
import '../models/register_params.dart';

@Injectable(as: BaseAuthRepo)
class AuthRepo extends BaseAuthRepo{
  final AuthDataSource  apiProvider;
  AuthRepo(this.apiProvider);

  @override
  Future<String> login(LoginParams params) async{
    final response = await apiProvider.login(params);
    return response.payload!;
  }

  @override
  Future<String> register(RegisterParams params) async{
    final response = await apiProvider.register(params);
    return response.payload!;
  }

}
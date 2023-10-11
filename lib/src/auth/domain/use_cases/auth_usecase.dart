import 'package:delala/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/showroom_login_params.dart';
import '../repositories/base_auth_repo.dart';

@Injectable()
class AuthUseCase {
  final BaseAuthRepo repository ;
  AuthUseCase(this.repository);

  Future<Profile> loginAsUser(LoginParams params) async {
    final data = await repository.loginAsUser(params);
    await HelperMethods.saveProfile(data);
    return Profile.fromDto(data);
  }

  Future<Profile> loginAsShowroom(ShowroomLoginParams params) async{
    final data = await  repository.loginAsShowroom(params);
    await HelperMethods.saveProfile(data);
    return Profile.fromDto(data);
  }

  Future<Profile> register(RegisterParams params) async{
    final data = await  repository.register(params);
    await HelperMethods.saveProfile(data);
    return Profile.fromDto(data);
  }

}
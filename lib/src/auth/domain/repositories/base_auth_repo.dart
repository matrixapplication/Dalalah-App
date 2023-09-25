
import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/login_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/showroom_login_params.dart';


abstract class BaseAuthRepo {
  Future<ProfileDto> loginAsUser(LoginParams params);
  Future<ProfileDto> loginAsShowroom(ShowroomLoginParams params);
  Future<ProfileDto> register(RegisterParams params);
}

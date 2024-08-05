
import '../../../profile/data/models/profile_dto.dart';
import '../../data/models/login_params.dart';
import '../../data/models/login_real_estate_developer_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/send_otp_params.dart';
import '../../data/models/showroom_login_params.dart';
import '../../data/models/verify_otp_params.dart';


abstract class BaseAuthRepo {
  Future<ProfileDto> loginAsUser(LoginParams params);
  Future<ProfileDto> loginAsRealEstateDeveloper(LoginRealEstateDeveloperParams params);
  Future<ProfileDto> loginAsShowroom(ShowroomLoginParams params);
  Future<ProfileDto> register(RegisterParams params);
  Future<String> registerAsShowroom(RegisterParams params);
  Future<String> registerAsRealEstateDevelopers(RegisterParams params);
  Future<String> sendOtp(SendOTPParams params);
  Future<String> verifyOtp(VerifyOTPParams params);
}

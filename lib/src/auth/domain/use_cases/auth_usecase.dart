import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../data/models/login_params.dart';
import '../../data/models/login_real_estate_developer_params.dart';
import '../../data/models/register_params.dart';
import '../../data/models/send_otp_params.dart';
import '../../data/models/showroom_login_params.dart';
import '../../data/models/verify_otp_params.dart';
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
  Future<Profile> loginAsRealEstateDeveloper(LoginRealEstateDeveloperParams params) async {
    final data = await repository.loginAsRealEstateDeveloper(params);
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

  Future<String> registerAsShowroom(RegisterParams params) async{
    return await  repository.registerAsShowroom(params);
  }
  Future<String> registerAsRealEstateDevelopers(RegisterParams params) async{
    return await  repository.registerAsRealEstateDevelopers(params);
  }

  Future<String> sendOtp(SendOTPParams params) async{
    return await  repository.sendOtp(params);
  }

  Future<String> verifyOtp(VerifyOTPParams  params) async{
    return await  repository.verifyOtp(params);
  }

}
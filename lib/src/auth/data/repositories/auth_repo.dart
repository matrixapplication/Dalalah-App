
import 'package:injectable/injectable.dart';
import 'package:dalalah/src/auth/data/models/login_params.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../domain/repositories/base_auth_repo.dart';
import '../data_sources/auth_datasource.dart';
import '../models/login_real_estate_developer_params.dart';
import '../models/register_params.dart';
import '../models/send_otp_params.dart';
import '../models/showroom_login_params.dart';
import '../models/verify_otp_params.dart';

@Injectable(as: BaseAuthRepo)
class AuthRepo extends BaseAuthRepo{
  final AuthDataSource  apiProvider;
  AuthRepo(this.apiProvider);

  @override
  Future<ProfileDto> loginAsUser(LoginParams params) async{
    final response = await apiProvider.loginAsUser(params);
    return response.data!;
  }
  @override
  Future<ProfileDto> loginAsRealEstateDeveloper(LoginRealEstateDeveloperParams params) async{
    final response = await apiProvider.loginAsRealEstateDeveloper(params);
    return response.data!;
  }

  @override
  Future<ProfileDto> loginAsShowroom(ShowroomLoginParams params) async{
    final response = await apiProvider.loginAsShowroom(params);
    return response.data!;
  }

  @override
  Future<ProfileDto> register(RegisterParams params) async{
    final response = await apiProvider.register(params);
    return response.data!;
  }

  @override
  Future<String> registerAsShowroom(RegisterParams params) async{
    print('params.logo: ${params.toJson()}');
    final response = await apiProvider.registerAsShowroom(
      params.type ?? '',
      params.nameAr ?? '',
      params.nameEn ?? '',
      params.ownerNameAr ?? '',
      params.ownerNameEn ?? '',
      params.descriptionAr ?? '',
      params.descriptionEn ?? '',
      params.email ?? '',
      params.password ?? '',
      params.phone ?? '',
      params.anotherPhone1 ?? '',
      params.anotherPhone2 ?? '',
      params.whatsapp ?? '',
      params.cityId ?? 0,
      params.logo!,
    );
    return response.message ?? '';
  }
 @override
  Future<String> registerAsRealEstateDevelopers(RegisterParams params) async{
    final response = await apiProvider.registerAsRealEstateDevelopers(
      params.nameAr ?? '',
      params.nameEn ?? '',
      params.ownerNameAr ?? '',
      params.ownerNameEn ?? '',
      params.descriptionAr ?? '',
      params.descriptionEn ?? '',
      params.email ?? '',
      params.password ?? '',
      params.phone ?? '',
      params.whatsapp ?? '',
      params.cityId ?? 0,
      params.logo!,
      params.fcmToken??'',
      params.licenseNumber??''
    );
    return response.message ?? '';
  }

  @override
  Future<String> sendOtp(SendOTPParams params) async{
    final response = await apiProvider.sendOtp(params);
    return response.message ?? '';
  }

  @override
  Future<String> verifyOtp(VerifyOTPParams params) async{
    final response = await apiProvider.verifyOtp(params);
    return response.message ?? '';
  }

}
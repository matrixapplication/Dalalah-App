import 'dart:io';

import 'package:arabitac/core/network/api_response.dart';
import 'package:injectable/injectable.dart';

import '../../../auth/data/models/register_params.dart';
import '../../data/models/profile_dto.dart';
import '../entities/profile.dart';
import '../repositories/base_profile_repo.dart';



@Injectable()
class ProfileUseCase {
  final BaseProfileRepo repository ;
  ProfileUseCase(this.repository);

  Future<Profile> fetchProfileData() async{
    final data = await repository.fetchProfileData();
    return Profile.fromDto(data);
  }

  Future<String> deleteProfileData() {
    return repository.deleteProfileData();
  }

  Future<ApiResponse<ProfileDto>> editProfileData(RegisterParams params) {
    return repository.editProfileData(params);
  }

  Future<ApiResponse<ProfileDto>> editProfileImage(File image) {
    return repository.editProfileImage(image);
  }


}
import 'dart:io';

import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/core/utils/helper_methods.dart';
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
    // final data = await repository.fetchProfileData();
    // return Profile.fromDto(data);
    return Profile(
      name: 'Jorge David',
      phone: '0912345678',
      email: 'jorge@mail.com',
    );
  }

  Future<String> deleteProfileData() async {
    return repository.deleteProfileData();
  }

  Future<String> editProfileData(RegisterParams params) async {
    final data = await repository.editProfileData(params);
    await HelperMethods.saveProfile(data.data!);
    print('data.message ${data.message}');
    return data.message ?? 'error';
  }

  Future<String> editProfileImage(File image) async {
    final data = await repository.editProfileImage(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? 'error';
  }


}
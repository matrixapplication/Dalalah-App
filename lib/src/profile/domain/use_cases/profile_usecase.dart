import 'dart:io';

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
    final data = await repository.fetchProfileData();
    HelperMethods.saveProfile(data);
    return Profile.fromDto(data);
  }

  Future<Profile> fetchProfileDataFromCash() async{
    final data  = await HelperMethods.getProfile();
    return Profile.fromDto(data!);
  }

  Future<String> deleteProfileData() async {
    ProfileDto? user = await HelperMethods.getProfile();
    return repository.deleteProfileData(user?.role ?? '');
  }

  Future<String> editProfileData(RegisterParams params) async {
    final data = await repository.editProfileData(params);
    print('repository ${data.data?.toJson()}');
    await HelperMethods.saveProfile(data.data!);
    final profile = await HelperMethods.getProfile();
    print('editProfileData ${profile?.toJson()}');
    return data.message ?? '';
  }

  Future<String> editProfileImage(File image) async {
    final data = await repository.editProfileImage(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

  Future<Profile> fetchProfileDataShowroom() async{
    final data = await repository.fetchProfileDataShowroom();
    await HelperMethods.saveProfile(data);
    return Profile.fromDto(data);
  }

  Future<String> editProfileDataShowroom(RegisterParams params) async {
    final data = await repository.editProfileDataShowroom(params);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

  Future<String> editProfileImageShowroom(File image) async {
    final data = await repository.editProfileImageShowroom(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

  Future<String> editLogoShowroom(File image) async {
    final data = await repository.editLogoShowroom(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

  Future<String> editCoverImageShowroom(File image) async {
    final data = await repository.editCoverImageShowroom(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

  Future<String> editTaxCardShowroom(File image) async {
    final data = await repository.editTaxCardShowroom(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

  Future<String> editCommercialImageShowroom(File image) async {
    final data = await repository.editCommercialImageShowroom(image);
    await HelperMethods.saveProfile(data.data!);
    return data.message ?? '';
  }

}
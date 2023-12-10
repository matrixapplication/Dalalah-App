
import 'dart:io';

import 'package:injectable/injectable.dart';

import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/register_params.dart';
import '../../domain/repositories/base_profile_repo.dart';
import '../data_sources/profile_datasource.dart';
import '../models/profile_dto.dart';


@Injectable(as: BaseProfileRepo)
class ProfileRepo extends BaseProfileRepo{
  final ProfileDataSource  apiProvider;
  ProfileRepo(this.apiProvider);

  @override
  Future<ProfileDto> fetchProfileData() async{
    final response = await apiProvider.fetchProfileData();
    return response.data!;
  }

  @override
  Future<String> deleteProfileData() async{
    final response = await apiProvider.deleteProfileData();
    return response.message ?? 'error';
  }

  @override
  Future<ApiResponse<ProfileDto>> editProfileData(RegisterParams params) async{
    return await apiProvider.editProfileData(params);
  }

  @override
  Future<ApiResponse<ProfileDto>> editProfileImage(File image) async{
    return await apiProvider.editProfileImage(image);
  }


  @override
  Future<ProfileDto> fetchProfileDataShowroom() async{
    final response = await apiProvider.fetchProfileDataShowroom();
    return response.data!;
  }

  @override
  Future<ApiResponse<ProfileDto>> editProfileDataShowroom(RegisterParams params) async{
    return await apiProvider.editProfileDataShowroom(params);
  }

  @override
  Future<ApiResponse<ProfileDto>> editProfileImageShowroom(File image) async{
    return await apiProvider.editProfileImageShowroom(image);
  }

}
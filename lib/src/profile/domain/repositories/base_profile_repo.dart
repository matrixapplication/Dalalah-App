
import 'dart:io';

import '../../../../core/network/api_response.dart';
import '../../../auth/data/models/register_params.dart';
import '../../data/models/profile_dto.dart';
import '../entities/profile.dart';



abstract class BaseProfileRepo<T>{
  Future<ProfileDto> fetchProfileData();
  Future<String> deleteProfileData(String modelRole);
  Future<ApiResponse<ProfileDto>> editProfileData(RegisterParams params);
  Future<ApiResponse<ProfileDto>> editProfileImage(File image);
  // Showrooms APIs
  Future<ProfileDto> fetchProfileDataShowroom();
  Future<ApiResponse<ProfileDto>> editProfileDataShowroom(RegisterParams params);
  Future<ApiResponse<ProfileDto>> editProfileImageShowroom(File image);

  Future<ApiResponse<ProfileDto>> editLogoShowroom(File image);
  Future<ApiResponse<ProfileDto>> editCoverImageShowroom(File image);
  Future<ApiResponse<ProfileDto>> editTaxCardShowroom(File image);
  Future<ApiResponse<ProfileDto>> editCommercialImageShowroom(File image);
}

import 'dart:io';

import 'package:dalalah/src/auth/data/models/register_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../models/profile_dto.dart';


part 'profile_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  ProfileDataSource{

  @factoryMethod
  factory ProfileDataSource(Dio dio) = _ProfileDataSource;

  @GET('/get-user')
  Future<ApiResponse<ProfileDto>> fetchProfileData();

  @POST('/deleteAccount')
  Future<ApiResponse<String>> deleteProfileData(@Query('model_id') String modelRole);

  @POST('/edit-user')
  Future<ApiResponse<ProfileDto>> editProfileData(@Body() RegisterParams params);

  @POST('/edit-user-image')
  Future<ApiResponse<ProfileDto>> editProfileImage(@Part(name: 'image') File image);

  // Showrooms APIs
  @GET('/get-showroom')
  Future<ApiResponse<ProfileDto>> fetchProfileDataShowroom();

  @POST('/edit-showroom')
  Future<ApiResponse<ProfileDto>> editProfileDataShowroom(@Body() RegisterParams params);

  @POST('/edit-showroom-image')
  Future<ApiResponse<ProfileDto>> editProfileImageShowroom(@Part(name: 'logo') File image);

  @POST('/edit-showroom')
  Future<ApiResponse<ProfileDto>> editLogoShowroom(@Part(name: 'logo') File image);

  @POST('/edit-showroom')
  Future<ApiResponse<ProfileDto>> editCoverImageShowroom(@Part(name: 'cover_image') File image);

  @POST('/edit-showroom')
  Future<ApiResponse<ProfileDto>> editTaxCardShowroom(@Part(name: 'cover_image') File image);

  @POST('/edit-showroom')
  Future<ApiResponse<ProfileDto>> editCommercialImageShowroom(@Part(name: 'commercial') File image);

}
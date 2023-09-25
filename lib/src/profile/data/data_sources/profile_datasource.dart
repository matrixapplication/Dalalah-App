import 'dart:io';

import 'package:arabitac/src/auth/data/models/register_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entities/profile.dart';
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
  Future<ApiResponse<String>> deleteProfileData();

  @POST('/edit-user')
  Future<ApiResponse<ProfileDto>> editProfileData(@Body() RegisterParams params);

  @POST('/edit-user-image')
  Future<ApiResponse<ProfileDto>> editProfileImage(@Part(name: 'image') File image);
}
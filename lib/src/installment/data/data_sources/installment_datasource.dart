import 'dart:io';

import 'package:dalalah/src/auth/data/models/register_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../models/profile_dto.dart';


part 'installment_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  InstallmentDataSource{

  @factoryMethod
  factory InstallmentDataSource(Dio dio) = _InstallmentDataSource;

  @GET('/get-user')
  Future<ApiResponse<ProfileDto>> fetchInstallment();

  @POST('/deleteAccount')
  Future<ApiResponse<String>> deleteProfileData();

  @POST('/edit-user')
  Future<ApiResponse<ProfileDto>> editProfileData(@Body() RegisterParams params);

  @POST('/edit-user-image')
  Future<ApiResponse<ProfileDto>> editProfileImage(@Part(name: 'image') File image);
}
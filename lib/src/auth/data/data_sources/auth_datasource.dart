import 'dart:io';

import 'package:dalalah/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/utils/constants.dart';
import 'package:dalalah/src/auth/data/models/login_params.dart';
import 'package:dalalah/core/network/api_response.dart';

import '../models/register_params.dart';
import '../models/send_otp_params.dart';
import '../models/showroom_login_params.dart';
import '../models/verify_otp_params.dart';

part 'auth_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class AuthDataSource {
  @factoryMethod
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/end-user/login')
  Future<ApiResponse<ProfileDto>> loginAsUser(@Body() LoginParams params);

  @POST('/showroom/login')
  Future<ApiResponse<ProfileDto>> loginAsShowroom(
      @Body() ShowroomLoginParams params);

  @POST('/end-user/register')
  Future<ApiResponse<ProfileDto>> register(@Body() RegisterParams params);

  @MultiPart()
  @POST('/showroom/register')
  Future<ApiResponse<ProfileDto>> registerAsShowroom(
    @Part(name: 'type') String type,
    @Part(name: 'name_ar') String nameAr,
    @Part(name: 'name_en') String nameEn,
    @Part(name: 'owner_name_ar') String ownerNameAr,
    @Part(name: 'owner_name_en') String ownerNameEn,
    @Part(name: 'description_ar') String addressAr,
    @Part(name: 'description_en') String addressEn,
    @Part(name: 'email') String email,
    @Part(name: 'password') String password,
    @Part(name: 'phone') String phone,
    @Part(name: 'another_phone_1') String anotherPhone1,
    @Part(name: 'another_phone_2') String anotherPhone2,
    @Part(name: 'whatsapp') String whatsapp,
    @Part(name: 'city_id') int cityId,
    @Part(name: 'logo') File logo,
  );

  @POST('/verify-account/generate-otp')
  Future<ApiResponse> sendOtp(@Body() SendOTPParams params);

  @POST('/verify-account/confirm-otp')
  Future<ApiResponse> verifyOtp(@Body() VerifyOTPParams params);
}

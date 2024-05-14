import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../models/forgot_password_params.dart';
import '../models/password_otp_params.dart';
import '../models/verify_password_otp_params.dart';

part 'forgot_password_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  ForgotPasswordDataSource{

  @factoryMethod
  factory ForgotPasswordDataSource(Dio dio) = _ForgotPasswordDataSource;

  @POST('/reset-password/generate-otp')
  Future<ApiResponse> generateOTP(@Body() PasswordOTPParams params);

  @POST('/reset-password/confirm-otp')
  Future<ApiResponse> verifyPasswordOTP(@Body() VerifyPasswordOTPParams params);

  @POST('/reset-password/change-password')
  Future<ApiResponse> forgotPassword(@Body() ForgotPasswordParams params);
}
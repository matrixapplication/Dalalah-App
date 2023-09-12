import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/network/api_response.dart';

import '../../../../core/utils/constants.dart';
import '../models/forgot_password_params.dart';

part 'forgot_password_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  ForgotPasswordDataSource{

  @factoryMethod
  factory ForgotPasswordDataSource(Dio dio) = _ForgotPasswordDataSource;

  @POST('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> enterPhoneNumber(@Body() String phoneNumber);

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> enterCode(@Body() String code);

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> forgotPassword(@Body() ForgotPasswordParams params);
}
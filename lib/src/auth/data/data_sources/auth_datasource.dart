import 'package:arabitac/src/profile/data/models/profile_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/utils/constants.dart';
import 'package:arabitac/src/auth/data/models/login_params.dart';
import 'package:arabitac/core/network/api_response.dart';

import '../models/register_params.dart';
import '../models/showroom_login_params.dart';

part 'auth_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  AuthDataSource{

  @factoryMethod
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/end-user/login')
  Future<ApiResponse<ProfileDto>> loginAsUser(@Body() LoginParams params);

  @POST('/showroom/login')
  Future<ApiResponse<ProfileDto>> loginAsShowroom(@Body() ShowroomLoginParams params);

  @POST('/end-user/register')
  Future<ApiResponse<ProfileDto>> register(RegisterParams params);

}
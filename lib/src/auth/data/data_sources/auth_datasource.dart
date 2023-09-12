import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/utils/constants.dart';
import 'package:arabitac/src/auth/data/models/login_params.dart';
import 'package:arabitac/core/network/api_response.dart';

import '../models/register_params.dart';

part 'auth_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: baseApiUrl)
abstract class  AuthDataSource{

  @factoryMethod
  factory AuthDataSource(Dio dio) = _AuthDataSource;

  @POST('/affiliate/v1/auth/login')
  Future<ApiResponse<String>> login(@Body() LoginParams params);

  @GET('/affiliate/v1/auth/login')
  Future<ApiResponse<String>> register(RegisterParams params);
}
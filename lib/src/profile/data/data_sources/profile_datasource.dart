import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/network/api_response.dart';

import '../../domain/entities/profile.dart';


part 'profile_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: 'kBASE_URL')
abstract class  ProfileDataSource{

  @factoryMethod
  factory ProfileDataSource(Dio dio) = _ProfileDataSource;

  @POST('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<Profile>> fetchProfileData();

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> deleteProfileData();

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> editProfileData();
}
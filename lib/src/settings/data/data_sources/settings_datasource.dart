import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';

part 'settings_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: 'kBASE_URL')
abstract class  SettingsDatasource{

  @factoryMethod
  factory SettingsDatasource(Dio dio) = _SettingsDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<String>> fetchAbout();
}
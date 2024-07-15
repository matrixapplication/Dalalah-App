import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dalalah/core/network/api_response.dart';
import 'package:dalalah/core/utils/constants.dart';

import '../../domain/entities/real_estate.dart';

part 'real_estate_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  RealEstateDatasource{

  @factoryMethod
  factory RealEstateDatasource(Dio dio) = _RealEstateDatasource;

  @GET('/api/v1/Operations/GetAllOperations')
  Future<ApiResponse<List<Notifications>>> fetchNotifications();
}
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../models/notification_dto.dart';

part 'price_requests_datasource.g.dart';
@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class  PriceRequestsDatasource{

  @factoryMethod
  factory PriceRequestsDatasource(Dio dio) = _PriceRequestsDatasource;

  @POST('/price_request/{id}')
  Future<ApiResponse> priceRequest(@Path('id') int id);

  @GET('/get_price_requests')
  Future<ApiResponse<List<NotificationDto>>> fetchPriceRequests(@Query('page') int page);
}
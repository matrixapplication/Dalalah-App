
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../sell_car/domain/entities/shipment.dart';

part 'favorites_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class FavoritesDatasource {
  @factoryMethod
  factory FavoritesDatasource(Dio dio) = _FavoritesDatasource;

  @GET('/api/v1/Shipments/GetAllShipments')
  Future<ApiResponse<List<String>>> fetchFavorites();

  @GET('/api/v1/Shipments/GetShipmentDetails/shipmentId')
  Future<ApiResponse<String>> toggleFavorite(@Query('id') String id);
}

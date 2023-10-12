
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

import '../../../../core/network/api_response.dart';
import '../../../../core/utils/constants.dart';
import '../../../sell_car/domain/entities/shipment.dart';

part 'plates_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class PlatesDatasource {
  @factoryMethod
  factory PlatesDatasource(Dio dio) = _PlatesDatasource;

  @GET('/api/v1/Shipments/GetAllShipments')
  Future<ApiResponse<List<String>>> fetchPlates();

  @GET('/api/v1/Shipments/GetShipmentDetails/shipmentId')
  Future<ApiResponse<String>> toggleFavorite(@Query('id') String id);
}

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:arabitac/core/network/api_response.dart';
import 'package:arabitac/core/utils/constants.dart';

import '../../domain/entities/shipment.dart';
import '../../domain/entities/shipment_details.dart';
import '../models/delay_shipment_params.dart';
import '../models/notes_on_shipment_params.dart';
import '../models/shipment_delivery_params.dart';
import '../models/shipment_refused_params.dart';

part 'sell_car_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kBaseUrl)
abstract class SellCarDatasource {
  @factoryMethod
  factory SellCarDatasource(Dio dio) = _SellCarDatasource;

  @GET('/api/v1/Shipments/GetAllShipments')
  Future<ApiResponse<List<Shipment>>> fetchShipments();

  @GET('/api/v1/Shipments/GetShipmentDetails/shipmentId')
  Future<ApiResponse<ShipmentDetails>> fetchShipmentDetails(@Query('shipmentId') int shipmentId);

  @POST('/api/v1/Shipments/Delivery')
  Future<ApiResponse<String>> shipmentDelivery(@Body() ShipmentDeliveryParams params);

  @POST('/api/v1/Shipments/Refused')
  Future<ApiResponse<String>> shipmentRefused(@Body() ShipmentRefusedParams params);

  @POST('/api/v1/Shipments/Notes')
  Future<ApiResponse<String>> notesOnShipment(@Body() NotesOnShipmentParams params);

  @POST('/api/v1/Shipments/Delay')
  Future<ApiResponse<String>> delayShipment(@Body() DelayShipmentParams params);
}

import 'package:injectable/injectable.dart';

import '../../domain/entities/shipment.dart';
import '../../domain/entities/shipment_details.dart';
import '../../domain/repositories/base_sell_car_repo.dart';
import '../data_sources/sell_car_datasource.dart';
import '../models/delay_shipment_params.dart';
import '../models/notes_on_shipment_params.dart';
import '../models/shipment_delivery_params.dart';
import '../models/shipment_refused_params.dart';


@Injectable(as: BaseSellCarRepo)
class SellCarRepo extends BaseSellCarRepo{
  final SellCarDatasource  datasource;
  SellCarRepo(this.datasource);

  @override
  Future<List<Shipment>> fetchShipments() async {
    final data = await datasource.fetchShipments();
    return data.payload!;
  }

  @override
  Future<ShipmentDetails> fetchShipmentDetails(int shipmentId) async {
    final data = await datasource.fetchShipmentDetails(shipmentId);
    return data.payload!;
  }

  @override
  Future<String> shipmentDelivery(ShipmentDeliveryParams params) async {
    final data = await datasource.shipmentDelivery(params);
    return data.message!;
  }

  @override
  Future<String> shipmentRefused(ShipmentRefusedParams params) async {
    final data = await datasource.shipmentRefused(params);
    return data.message!;
  }

  @override
  Future<String> notesOnShipment(NotesOnShipmentParams params) async {
    final data = await datasource.notesOnShipment(params);
    return data.message!;
  }

  @override
  Future<String> delayShipment(DelayShipmentParams params) async {
    final data = await datasource.delayShipment(params);
    return data.message!;
  }
}
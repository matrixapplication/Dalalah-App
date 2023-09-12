

import '../../data/models/delay_shipment_params.dart';
import '../../data/models/notes_on_shipment_params.dart';
import '../../data/models/shipment_delivery_params.dart';
import '../../data/models/shipment_refused_params.dart';
import '../entities/shipment.dart';
import '../entities/shipment_details.dart';

abstract class BaseSellCarRepo {
  Future<List<Shipment>> fetchShipments();
  Future<ShipmentDetails> fetchShipmentDetails(int shipmentId);
  Future<String> shipmentDelivery(ShipmentDeliveryParams params);
  Future<String> shipmentRefused(ShipmentRefusedParams params);
  Future<String> notesOnShipment(NotesOnShipmentParams params);
  Future<String> delayShipment(DelayShipmentParams params);

}

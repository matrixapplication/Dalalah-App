import 'package:injectable/injectable.dart';

import '../entities/shipment_qr_code.dart';
import '../repositories/base_home_repo.dart';

@Injectable()
class HomeUseCase {
  final BaseHomeRepo repository ;
  HomeUseCase(this.repository);

  Future<bool> fetchClientStatus() async {
    //return await repository.fetchClientStatus();
    return true;
  }

  Future<String> reasonForDisconnection(String reason) async {
    return await repository.reasonForDisconnection(reason);
  }
  Future<List<ShipmentQRCode>> scanToReceive(String id) async {
    // return await repository.scanToReceive(id);
    return [
      ShipmentQRCode(
        id: 1,
        name: 'شنطة جلد طبيعى ماركة شي إن',
      ),
      ShipmentQRCode(
        id: 1,
        name: 'شنطة جلد طبيعى ماركة شي إن',
      ),
    ];
  }

  Future<List<ShipmentQRCode>> scanToPick(String id) async {
    // return await repository.scanToPick(id);
    return [
      ShipmentQRCode(
        id: 1,
        name: 'شنطة جلد طبيعى ماركة شي إن',
      ),
      ShipmentQRCode(
        id: 1,
        name: 'شنطة جلد طبيعى ماركة شي إن',
      ),
    ];
  }
}
import 'package:injectable/injectable.dart';

import '../../data/models/delay_shipment_params.dart';
import '../../data/models/notes_on_shipment_params.dart';
import '../../data/models/shipment_delivery_params.dart';
import '../../data/models/shipment_refused_params.dart';
import '../../data/repositories/sell_car_repo.dart';
import '../entities/shipment.dart';
import '../entities/shipment_details.dart';

@Injectable()
class SellCarUseCase {
  final SellCarRepo repository ;
  SellCarUseCase(this.repository);

  Future<List<Shipment>> fetchShipments() async {
   // final data = await repository.fetchShipments();
   //  return data;
    return [
      Shipment(
        id: 1,
       phone: '+201141475581',
       shopPhone: '+201141475581',
       status: 'تم استعجال الشحنة',
        shipmentNumber: '5468427334',
        shipmentType: 'ساعة جلد طبيعى',
        notes: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        recipientAddress: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        sender: 'شادي السيد محمد محمود',
        shop: 'سوق.كوم - سعيد جمال',
      ),
      Shipment(
        id: 2,
        phone: '+201141475581',
        shopPhone: '+201141475581',
        status: 'تم استعجال الشحنة',
        shipmentNumber: '5468427334',
        shipmentType: 'ساعة جلد طبيعى',
        notes: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        recipientAddress: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        sender: 'محمد عبد الرحمن محمد',
        shop: 'سوق.كوم - سعيد جمال',
      ),
      Shipment(
        id: 3,
        phone: '+201141475581',
        shopPhone: '+201141475581',
        status: 'تم استعجال الشحنة',
        shipmentNumber: '5468427334',
        shipmentType: 'ساعة جلد طبيعى',
        notes: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        recipientAddress: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        sender: 'سعيد جمال محمد',
        shop: 'سوق.كوم - سعيد جمال',
      ),
    ];
  }

  Future<ShipmentDetails> fetchShipmentDetails(int shipmentId) async {
    //final data = await repository.fetchShipmentDetails(shipmentId);
    return ShipmentDetails(
      id: 1,
      phone: '+201141475581',
      shopPhone: '+201141475581',
      whatsapp: '+201141475581',
      shopWhatsapp: '+201141475581',
      status: 'تم استعجال الشحنة',
      shipmentNumber: '5468427334',
      referenceNumber: '659845979',
      shipmentType: 'شنطة جلد طبيـ..',
      shipmentValue: '1000',
      notes: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
      receiverAddress: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
      receiver: 'شادي السيد محمد محمود',
      shop: 'سوق.كوم - سعيد جمال',
      callsHistory: [
        CallHistory(
          callDate: '13 November 2022',
         callBy: 'تم الاتصال بالراسل',
          callDuration: '15 ثانية',
             ),

  ],
      commentsCaptain: [
        Comment(
          commentDate: '13 November 12:54 AM',
          commentBy: 'محمد اسلام',
          comment: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        ),
      ],
      commentsCustomer: [
        Comment(
          commentDate: '13 November 12:54 AM',
          commentBy: 'محمد اسلام',
          comment: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        ),
      ],
      commentsLogeste: [
        Comment(
          commentDate: '13 November 12:54 AM',
          commentBy: 'محمد اسلام',
          comment: 'مصر القاهرة الجديدة مدينة نصر الحى السابع امام صيدلية الطرشوبى عمارة 11 شقة 6 ',
        ),
      ],
    );
  }

  Future<String> shipmentDelivery(ShipmentDeliveryParams params) async {
    final data = await repository.shipmentDelivery(params);
    return data;
  }

  Future<String> shipmentRefused(ShipmentRefusedParams params) async {
    final data = await repository.shipmentRefused(params);
    return data;
  }

  Future<String> notesOnShipment(NotesOnShipmentParams params) async {
    final data = await repository.notesOnShipment(params);
    return data;
  }

  Future<String> delayShipment(DelayShipmentParams params) async {
    final data = await repository.delayShipment(params);
    return data;
  }
}
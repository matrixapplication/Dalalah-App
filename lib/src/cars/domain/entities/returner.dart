
import '../../data/models/returner_dto.dart';

class Returner {
  String? serial;
  int? shipments;

  Returner({this.serial, this.shipments});

  factory Returner.fromJson(ReturnerDto json) {
    return Returner(
      serial: json.serial,
      shipments: json.shpments,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serial': serial,
      'shipments': shipments,
    };
  }
}



class ShipmentQRCode {
  final int id;
  final String name;

  ShipmentQRCode({required this.id, required this.name});

  factory ShipmentQRCode.fromJson(Map<String, dynamic> json) {
    return ShipmentQRCode(
      id: json['id'],
      name: json['name'],
    );
  }
}
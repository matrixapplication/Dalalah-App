
class Shipment{
  final int id;
  final String phone;
  final String shopPhone;
  final String status;
  final String shipmentNumber;
  final String shipmentType;
  final String sender;
  final String shop;
  final String recipientAddress;
  final String notes;

  Shipment({
    required this.id,
    required this.phone,
    required this.shopPhone,
    required this.status,
    required this.shipmentNumber,
    required this.shipmentType,
    required this.sender,
    required this.shop,
    required this.recipientAddress,
    required this.notes,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) {
    return Shipment(
      id: json['id'],
      phone: json['phone'],
      shopPhone: json['shopPhone'],
      status: json['status'],
      shipmentNumber: json['shipmentNumber'],
      shipmentType: json['shipmentType'],
      sender: json['sender'],
      shop: json['shop'],
      recipientAddress: json['receiverAddress'],
      notes: json['notes'],
    );
  }
}
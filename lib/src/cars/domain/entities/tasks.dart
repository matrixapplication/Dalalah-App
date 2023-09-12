
class Task{
  final int id;
  final String name;
  final String? description;
  final String? address;
  final String? date;
  final String? phone;
  final String? status;
  final String? shipmentNumber;

  Task({
    required this.id,
    required this.name,
    this.description,
    this.address,
    this.date,
    this.phone,
    this.status,
    this.shipmentNumber,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      date: json['date'],
      phone: json['phone'],
      status: json['status'],
      shipmentNumber: json['shipmentsNumber'],
    );
  }
}
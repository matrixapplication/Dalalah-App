
import '../../data/models/agency_dto.dart';

class Agency {
  int? id;
  String? ownerName;
  String? showroomName;
  String? description;
  String? code;
  String? phone;
  String? whatsapp;
  String? endTaxCard;
  String? role;
  int? countCars;
  String? avgRate;
  String? address;
  bool? isBlocked;
  String? image;
  String? coverImage;

  Agency(
      {this.id, this.ownerName, this.showroomName, this.description, this.code, this.phone, this.whatsapp, this.endTaxCard, this.role, this.countCars, this.avgRate, this.address, this.isBlocked, this.image, this.coverImage});

  factory Agency.fromDto(AgencyDto json) =>
      Agency(
        id: json.id,
        ownerName: json.ownerName,
        showroomName: json.showroomName,
        description: json.description,
        code: json.code,
        phone: json.phone,
        whatsapp: json.whatsapp,
        endTaxCard: json.endTaxCard,
        role: json.role,
        countCars: json.countCars,
        avgRate: json.avgRate,
        address: json.address,
        isBlocked: json.isBlocked,
        image: json.image,
        coverImage: json.coverImage,
      );
}


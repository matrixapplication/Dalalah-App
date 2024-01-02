
import '../../data/models/showroom_dto.dart';

class Showroom {
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
  String? address;
  bool? isBlocked;
  String? image;
  String? coverImage;
  bool? isAgency;
  bool? isFollowed;
  String? avgRate;

  Showroom({this.id, this.ownerName, this.showroomName, this.description, this.code, this.phone, this.whatsapp, this.endTaxCard, this.role, this.countCars, this.address, this.isBlocked, this.image, this.coverImage, this.isAgency, this.isFollowed, this.avgRate});

   factory Showroom.fromDto(ShowroomDto json){
     return Showroom(
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
       address: json.address,
       isBlocked: json.isBlocked,
       image: json.image,
       coverImage: json.coverImage,
       isFollowed: json.isFollowed,
        avgRate: json.avgRate,

       // isAgency: json.role == 'agency',
     );
   }
}


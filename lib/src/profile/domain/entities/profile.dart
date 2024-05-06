import 'package:dalalah/src/sell_car/data/models/city_dto.dart';

import '../../../sell_car/domain/entities/city.dart';
import '../../data/models/profile_dto.dart';

class Profile {
  int? id;
  String? name;
  String? ownerNameEn;
  String? ownerNameAr;
  String? nameAr;
  String? nameEn;
  String? addressAr;
  String? addressEn;
  String? descriptionAr;
  String? descriptionEn;
  String? email;
  String? phone;
  String? anotherPhone1;
  String? anotherPhone2;
  String? whatsApp;
  String? role;
  String? image;
  City? city;
  String? token;
  bool? isHidePayment;

  Profile(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.anotherPhone1,
      this.anotherPhone2,
      this.whatsApp,
      this.role,
      this.image,
      this.city,
      this.token,
      this.isHidePayment,
      this.ownerNameEn,
      this.ownerNameAr,
      this.nameAr,
      this.nameEn,
      this.addressAr,
      this.addressEn,
      this.descriptionAr,
      this.descriptionEn,
      });

  factory Profile.fromDto(ProfileDto json) {
    return Profile(
      id: json.id,
      name: json.name,
      ownerNameEn: json.ownerNameEn,
      ownerNameAr: json.ownerNameAr,
      nameAr: json.nameAr,
      nameEn: json.nameEn,
      addressAr: json.addressAr,
      addressEn: json.addressEn,
      descriptionAr: json.descriptionAr,
      descriptionEn: json.descriptionEn,
      email: json.email,
      phone: json.phone,
      anotherPhone1: json.anotherPhone1,
      anotherPhone2: json.anotherPhone2,
      whatsApp: json.whatsapp,
      role: json.role,
      image: json.image,
      city: City.fromDto(json.city ?? CityDto()),
      token: json.token,
      isHidePayment: false,
    );
  }
//
// Map<String, dynamic> toJson() {
//   return {
//     'id': id,
//     'name': name,
//     'email': email,
//     'phone': phone,
//     'whatsApp': whatsApp,
//     'role': role,
//     'image': image,
//     'city': city?.toJson(),
//     'token': token,
//   };
// }
}


import 'package:dalalah/src/sell_car/data/models/city_dto.dart';

import '../../../sell_car/domain/entities/city.dart';
import '../../data/models/profile_dto.dart';

class Profile {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? whatsApp;
  String? role;
  String? image;
  City? city;
  String? token;
  bool? isDisablePayment;

  Profile({this.id, this.name, this.email, this.phone, this.whatsApp, this.role, this.image, this.city, this.token, this.isDisablePayment});

  factory Profile.fromDto(ProfileDto json) {
    return Profile(
      id: json.id,
      name: json.name,
      email: json.email,
      phone: json.phone,
      whatsApp: json.whatsapp,
      role: json.role,
      image: json.image,
      city:  City.fromDto(json.city ?? CityDto()),
      token: json.token,
      isDisablePayment: false,
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


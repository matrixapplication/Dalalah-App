import 'dart:io';

class RegisterParams {
  final String? type;
  final String? ownerNameEn;
  final String? ownerNameAr;
  final String? name;
  final String? nameAr;
  final String? nameEn;
  final String? address;
  final String descriptionAr;
  final String descriptionEn;
  final String? email;
  final String? password;
  final String? phone;
  final String? anotherPhone1;
  final String? anotherPhone2;
  final String? whatsapp;
  final int? cityId;
  final int? districtId;
  final String? endTaxCard;
  final File? taxCard;
  final File? logo;
  final File? coverImage;
  final File? commercial;
  final String? fcmToken;

  RegisterParams({
    this.type,
    this.ownerNameEn,
    this.ownerNameAr,
    this.name,
    this.nameAr,
    this.nameEn,
    this.address,
    this.descriptionAr = '',
    this.descriptionEn = '',
    this.email,
    this.password,
    this.phone,
    this.anotherPhone1,
    this.anotherPhone2,
    this.whatsapp,
    this.cityId,
    this.districtId,
    this.endTaxCard,
    this.taxCard,
    this.logo,
    this.coverImage,
    this.commercial,
    this.fcmToken,
  });

  // For User Registration
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'type': type ?? '',
      'name': name ?? '',
      'owner_name_en': ownerNameEn ?? '',
      'owner_name_ar': ownerNameAr ?? '',
      'name_ar': nameAr ?? '',
      "name_en": nameEn ?? "",
      "description_ar": descriptionAr ?? "",
      "description_en": descriptionEn ?? "",
      'phone': phone ?? '',
      'another_phone_1': anotherPhone1 ?? '',
      'another_phone_2': anotherPhone2 ?? '',
      'email': email ?? '',
      'password': password ?? '',
      'city_id': cityId ?? '',
      'whatsapp': whatsapp ?? '',
      'fcm_token': fcmToken ?? '',
    };

    // remove null values from map
    data.removeWhere((key, value) => value == null || value == '');
    return data;
  }
}

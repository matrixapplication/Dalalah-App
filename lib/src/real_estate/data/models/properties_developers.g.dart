// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_developers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertiesDevelopers _$PropertiesDevelopersFromJson(
        Map<String, dynamic> json) =>
    PropertiesDevelopers(
      id: json['id'] as int?,
      ownerName: json['owner_name'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      ownerNameAr: json['owner_name_ar'] as String?,
      ownerNameEn: json['owner_name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      licenseNumber: json['license_number'] as String?,
      whatsapp: json['whatsapp'] as String?,
      role: json['role'] as String?,
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
      isBlocked: json['is_blocked'] as bool?,
      image: json['image'] as String?,
      isVerified: json['is_verified'] as int?,
    );

Map<String, dynamic> _$PropertiesDevelopersToJson(
        PropertiesDevelopers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.ownerName,
      'name': instance.name,
      'description': instance.description,
      'owner_name_ar': instance.ownerNameAr,
      'owner_name_en': instance.ownerNameEn,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
      'email': instance.email,
      'phone': instance.phone,
      'license_number': instance.licenseNumber,
      'whatsapp': instance.whatsapp,
      'role': instance.role,
      'city': instance.city,
      'is_blocked': instance.isBlocked,
      'image': instance.image,
      'is_verified': instance.isVerified,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] as int?,
      name: json['name'] as String?,
      cityPayment: json['city_payment'] as String?,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city_payment': instance.cityPayment,
    };

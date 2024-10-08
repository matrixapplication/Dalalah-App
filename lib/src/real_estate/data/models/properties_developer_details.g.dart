// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'properties_developer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertiesDeveloperDetails _$PropertiesDeveloperDetailsFromJson(
        Map<String, dynamic> json) =>
    PropertiesDeveloperDetails(
      id: json['id'] as int?,
      ownerName: json['owner_name'] as String?,
      isFollowed: json['is_followed'] as bool?,
      avgRate: json['avg_rate'] as String?,
      followersCount: json['followers_count'] as int?,
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
      logo: json['logo'] as String?,
      isVerified: json['is_verified'] as int?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PropertiesDeveloperDetailsToJson(
        PropertiesDeveloperDetails instance) =>
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
      'logo': instance.logo,
      'is_verified': instance.isVerified,
      'is_followed': instance.isFollowed,
      'followers_count': instance.followersCount,
      'avg_rate': instance.avgRate,
      'properties': instance.properties,
    };

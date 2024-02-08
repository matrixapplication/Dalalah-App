// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      ownerNameAr: json['owner_name_ar'] as String?,
      ownerNameEn: json['owner_name_en'] as String?,
      nameAr: json['name_ar'] as String?,
      nameEn: json['name_en'] as String?,
      descriptionEn: json['description_en'] as String?,
      descriptionAr: json['description_ar'] as String?,
      email: json['email'] as String?,
      code: json['code'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      endTaxCard: json['end_tax_card'] as String?,
      role: json['role'] as String?,
      countCars: json['count_cars'] as int?,
      avgRate: json['avg_rate'] as String?,
      city: json['city'] == null
          ? null
          : CityDto.fromJson(json['city'] as Map<String, dynamic>),
      address: json['address'] as String?,
      isBlocked: json['is_blocked'] as bool?,
      isHide: json['is_hide'] as bool?,
      followers: json['followers'] as int?,
      isFollowed: json['is_followed'] as bool?,
      image: json['image'] as String?,
      coverImage: json['cover_image'] as String?,
      token: json['token'] as String?,
    )
      ..addressAr = json['address_en'] as String?
      ..addressEn = json['address_ar'] as String?;

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner_name_ar': instance.ownerNameAr,
      'owner_name_en': instance.ownerNameEn,
      'name_ar': instance.nameAr,
      'name_en': instance.nameEn,
      'address_en': instance.addressAr,
      'address_ar': instance.addressEn,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
      'email': instance.email,
      'code': instance.code,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'end_tax_card': instance.endTaxCard,
      'role': instance.role,
      'count_cars': instance.countCars,
      'avg_rate': instance.avgRate,
      'city': instance.city,
      'address': instance.address,
      'is_blocked': instance.isBlocked,
      'is_hide': instance.isHide,
      'followers': instance.followers,
      'is_followed': instance.isFollowed,
      'image': instance.image,
      'cover_image': instance.coverImage,
      'token': instance.token,
    };

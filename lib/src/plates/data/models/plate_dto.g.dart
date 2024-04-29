// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlateDto _$PlateDtoFromJson(Map<String, dynamic> json) => PlateDto(
      id: json['id'] as int?,
      letterAr: json['letter_ar'] as String?,
      letterEn: json['letter_en'] as String?,
      plateNumber: json['plate_number'],
      price: json['price'] as String?,
      plateType: json['plate_type'] as String?,
      boughtStatus: json['bought_status'] as String?,
      adType: json['ad_type'] as String?,
      address: json['address'] as String?,
      isSold: json['is_sold'] as bool?,
      isFeatured: json['is_featured'] as bool?,
      isHide: json['is_hide'] as bool?,
      isApproved: json['is_approved'] as bool?,
      city: json['city'] == null
          ? null
          : CityDto.fromJson(json['city'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : ProfileDto.fromJson(json['user'] as Map<String, dynamic>),
      isFavorite: json['is_favorite'] as bool?,
      userCarStatus: json['user_car_status'] as int?,
      createdAt: json['created_at'] as String?,
      lat: (json['lat'] as String?),
      lng: (json['lng'] as String?),
    );

Map<String, dynamic> _$PlateDtoToJson(PlateDto instance) => <String, dynamic>{
      'id': instance.id,
      'letter_ar': instance.letterAr,
      'letter_en': instance.letterEn,
      'plate_number': instance.plateNumber,
      'price': instance.price,
      'plate_type': instance.plateType,
      'bought_status': instance.boughtStatus,
      'ad_type': instance.adType,
      'address': instance.address,
      'is_featured': instance.isFeatured,
      'is_sold': instance.isSold,
      'is_hide': instance.isHide,
      'is_approved': instance.isApproved,
      'city': instance.city,
      'user': instance.user,
      'is_favorite': instance.isFavorite,
      'user_car_status': instance.userCarStatus,
      'created_at': instance.createdAt,
      'lat': instance.lat,
      'lng': instance.lng,
    };

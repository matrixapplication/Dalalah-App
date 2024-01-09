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
      isHide: json['is_hide'] as bool?,
      isPaused: json['is_paused'] as bool?,
      isApproved: json['is_approved'] as bool?,
      city: json['city'] == null
          ? null
          : CityDto.fromJson(json['city'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : ProfileDto.fromJson(json['user'] as Map<String, dynamic>),
      isFavorite: json['is_favorite'] as bool?,
      createdAt: json['created_at'] as String?,
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
      'is_hide': instance.isHide,
      'is_paused': instance.isPaused,
      'is_approved': instance.isApproved,
      'city': instance.city,
      'user': instance.user,
      'is_favorite': instance.isFavorite,
      'created_at': instance.createdAt,
    };

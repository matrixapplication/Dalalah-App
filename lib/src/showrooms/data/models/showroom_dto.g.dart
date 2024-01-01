// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showroom_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowroomDto _$ShowroomDtoFromJson(Map<String, dynamic> json) => ShowroomDto(
      id: json['id'] as int?,
      ownerName: json['owner_name'] as String?,
      showroomName: json['name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      endTaxCard: json['end_tax_card'] as String?,
      role: json['role'] as String?,
      countCars: json['count_cars'] as int?,
      address: json['address'] as String?,
      isBlocked: json['is_blocked'] as bool?,
      image: json['image'] as String?,
      coverImage: json['cover_image'] as String?,
      isFollowed: json['is_followed'] as bool?,
    );

Map<String, dynamic> _$ShowroomDtoToJson(ShowroomDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.ownerName,
      'name': instance.showroomName,
      'description': instance.description,
      'code': instance.code,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'end_tax_card': instance.endTaxCard,
      'role': instance.role,
      'count_cars': instance.countCars,
      'address': instance.address,
      'is_blocked': instance.isBlocked,
      'image': instance.image,
      'cover_image': instance.coverImage,
      'is_followed': instance.isFollowed,
    };

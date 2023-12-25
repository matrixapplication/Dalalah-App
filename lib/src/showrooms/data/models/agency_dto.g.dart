// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyDto _$AgencyDtoFromJson(Map<String, dynamic> json) => AgencyDto(
      id: json['id'] as int?,
      ownerName: json['owner_name'] as String?,
      showroomName: json['showroom_name'] as String?,
      description: json['description'] as String?,
      code: json['code'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      endTaxCard: json['end_tax_card'] as String?,
      role: json['role'] as String?,
      countCars: json['count_cars'] as int?,
      avgRate: json['avg_rate'] as String?,
      address: json['address'] as String?,
      isBlocked: json['is_blocked'] as bool?,
      image: json['image'] as String?,
      coverImage: json['cover_image'] as String?,
    );

Map<String, dynamic> _$AgencyDtoToJson(AgencyDto instance) => <String, dynamic>{
      'id': instance.id,
      'owner_name': instance.ownerName,
      'showroom_name': instance.showroomName,
      'description': instance.description,
      'code': instance.code,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'end_tax_card': instance.endTaxCard,
      'role': instance.role,
      'count_cars': instance.countCars,
      'avg_rate': instance.avgRate,
      'address': instance.address,
      'is_blocked': instance.isBlocked,
      'image': instance.image,
      'cover_image': instance.coverImage,
    };

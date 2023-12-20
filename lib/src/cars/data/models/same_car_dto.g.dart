// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'same_car_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SameCarDto _$SameCarDtoFromJson(Map<String, dynamic> json) => SameCarDto(
      id: json['id'] as int?,
      modelRole: json['model_role'] as String?,
      showroom: json['showroom'] == null
          ? null
          : ShowroomDto.fromJson(json['showroom'] as Map<String, dynamic>),
      city: json['city'] == null
          ? null
          : CityDto.fromJson(json['city'] as Map<String, dynamic>),
      price: json['price'] as String?,
      monthlyInstallment: json['monthly_installment'] as int?,
      description: json['description'] as String?,
      mainImage: json['main_image'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SameCarDtoToJson(SameCarDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model_role': instance.modelRole,
      'showroom': instance.showroom,
      'city': instance.city,
      'price': instance.price,
      'monthly_installment': instance.monthlyInstallment,
      'description': instance.description,
      'main_image': instance.mainImage,
      'images': instance.images,
    };

ShowroomDto _$ShowroomDtoFromJson(Map<String, dynamic> json) => ShowroomDto(
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
      address: json['address'] as String?,
      isBlocked: json['is_blocked'] as bool?,
      image: json['image'] as String?,
      coverImage: json['cover_image'] as String?,
    );

Map<String, dynamic> _$ShowroomDtoToJson(ShowroomDto instance) =>
    <String, dynamic>{
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
      'address': instance.address,
      'is_blocked': instance.isBlocked,
      'image': instance.image,
      'cover_image': instance.coverImage,
    };

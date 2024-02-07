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

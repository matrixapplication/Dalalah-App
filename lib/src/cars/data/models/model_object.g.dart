// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelObject _$ModelObjectFromJson(Map<String, dynamic> json) => ModelObject(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      countCars: json['count_cars'],
      description: json['description'] as String?,
      image: json['image'] as String?,
      coverImage: json['cover_image'] as String?,
    );

Map<String, dynamic> _$ModelObjectToJson(ModelObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'whatsapp': instance.whatsapp,
      'count_cars': instance.countCars,
      'description': instance.description,
      'image': instance.image,
      'cover_image': instance.coverImage,
    };

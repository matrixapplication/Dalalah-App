// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideDto _$SlideDtoFromJson(Map<String, dynamic> json) => SlideDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      url: json['url'] as String?,
      type: json['type'] as String?,
      typeId: json['type_id'] as int?,
    );

Map<String, dynamic> _$SlideDtoToJson(SlideDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'url': instance.url,
      'type': instance.type,
      'type_id': instance.typeId,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slide_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlideDto _$SlideDtoFromJson(Map<String, dynamic> json) => SlideDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      link: json['link'] as String?,
      type: json['type'] as String?,
      showroomId: json['showroom_id'],
    );

Map<String, dynamic> _$SlideDtoToJson(SlideDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'link': instance.link,
      'type': instance.type,
      'showroom_id': instance.showroomId,
    };

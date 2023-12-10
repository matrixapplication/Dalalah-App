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
    );

Map<String, dynamic> _$SlideDtoToJson(SlideDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'url': instance.url,
    };

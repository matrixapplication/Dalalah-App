// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      id: json['id'] as int?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      date: json['date'] as String?,
      type: json['type'] as String?,
      carId: json['car_id'] as int?,
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'date': instance.date,
      'type': instance.type,
      'car_id': instance.carId,
    };

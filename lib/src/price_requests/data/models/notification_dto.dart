import 'package:json_annotation/json_annotation.dart'; 

part 'notification_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class NotificationDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'car_id')
  int? carId;

  NotificationDto({this.id, this.title, this.message, this.date, this.type, this.carId});

   factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

   Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);
}


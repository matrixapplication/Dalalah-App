import 'package:json_annotation/json_annotation.dart'; 

part 'slide_dto.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class SlideDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'showroom_id')
  dynamic showroomId;

  SlideDto({this.id, this.title, this.image, this.link, this.type, this.showroomId});

   factory SlideDto.fromJson(Map<String, dynamic> json) => _$SlideDtoFromJson(json);

   Map<String, dynamic> toJson() => _$SlideDtoToJson(this);
}


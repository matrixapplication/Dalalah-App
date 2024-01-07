import 'package:json_annotation/json_annotation.dart'; 

part 'showroom_plates_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class ShowroomPlatesParams {
  @JsonKey(name: 'showroom_id')
  int? showroomId;
  @JsonKey(name: 'page')
  int? page;

  ShowroomPlatesParams({this.showroomId, this.page});

   factory ShowroomPlatesParams.fromJson(Map<String, dynamic> json) => _$ShowroomPlatesParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ShowroomPlatesParamsToJson(this);
}


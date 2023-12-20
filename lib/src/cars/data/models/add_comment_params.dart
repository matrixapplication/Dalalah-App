import 'package:json_annotation/json_annotation.dart'; 

part 'add_comment_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AddCommentParams {
  @JsonKey(name: 'car_id')
  int? carId;
  @JsonKey(name: 'plate_id')
  int? plateId;
  @JsonKey(name: 'body')
  String? body;

  AddCommentParams({this.carId, this.plateId, this.body});

   factory AddCommentParams.fromJson(Map<String, dynamic> json) => _$AddCommentParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddCommentParamsToJson(this);
}


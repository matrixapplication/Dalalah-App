import 'package:json_annotation/json_annotation.dart'; 

part 'comment_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CommentParams {
  @JsonKey(name: 'car_id')
  int? carId;
  @JsonKey(name: 'plate_id')
  int? plateId;
  @JsonKey(name: 'page')
  int? page;

  CommentParams({this.carId, this.plateId, this.page});

   factory CommentParams.fromJson(Map<String, dynamic> json) => _$CommentParamsFromJson(json);

   Map<String, dynamic> toJson() => _$CommentParamsToJson(this);
}


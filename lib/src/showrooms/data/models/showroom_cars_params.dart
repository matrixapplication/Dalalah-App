import 'package:json_annotation/json_annotation.dart'; 

part 'showroom_cars_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ShowroomCarsParams {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'page')
  int? page;

  // Not send in query but in path
  @JsonKey(name: 'id')
  int? id;

  ShowroomCarsParams({this.status, this.page, this.id});

   factory ShowroomCarsParams.fromJson(Map<String, dynamic> json) => _$ShowroomCarsParamsFromJson(json);

   Map<String, dynamic> toJson() => _$ShowroomCarsParamsToJson(this);
}


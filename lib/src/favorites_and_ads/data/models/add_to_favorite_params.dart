import 'package:json_annotation/json_annotation.dart'; 

part 'add_to_favorite_params.g.dart'; 

@JsonSerializable(ignoreUnannotated: true)
class AddToFavoriteParams {
  @JsonKey(name: 'car_id')
  int? carId;
  @JsonKey(name: 'plate_id')
  int? plateId;

  AddToFavoriteParams({this.carId, this.plateId});

   factory AddToFavoriteParams.fromJson(Map<String, dynamic> json) => _$AddToFavoriteParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddToFavoriteParamsToJson(this);
}


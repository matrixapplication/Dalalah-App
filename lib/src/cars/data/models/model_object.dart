import 'package:json_annotation/json_annotation.dart'; 

part 'model_object.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class ModelObject {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'whatsapp')
  String? whatsapp;
  @JsonKey(name: 'count_cars')
  dynamic countCars;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'cover_image')
  String? coverImage;

  ModelObject({this.id, this.name, this.phone, this.whatsapp, this.countCars, this.description, this.image, this.coverImage});

   factory ModelObject.fromJson(Map<String, dynamic> json) => _$ModelObjectFromJson(json);

   Map<String, dynamic> toJson() => _$ModelObjectToJson(this);
}


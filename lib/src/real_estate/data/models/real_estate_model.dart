import 'my_properties_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'real_estate_model.g.dart';

@JsonSerializable()
class RealEstatesModel {
  List<Property>? properties;

  RealEstatesModel({
    required this.properties,
  });
  factory RealEstatesModel.fromJson(Map<String, dynamic> json) => _$RealEstatesModelFromJson(json);
  Map<String, dynamic> toJson() => _$RealEstatesModelToJson(this);
}

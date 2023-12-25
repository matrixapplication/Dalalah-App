import 'dart:io';

import 'package:dalalah/src/sell_car/data/models/sell_car_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_image_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class EditImageCarParams {
  @JsonKey(name: 'car_id')
  int? carId;
  @JsonKey(name: 'image')
  @FileJsonConverter()
  File? image;
  @JsonKey(name: 'image_id')
  int? imageId;

  EditImageCarParams({this.carId, this.image, this.imageId});

   factory EditImageCarParams.fromJson(Map<String, dynamic> json) => _$EditImageCarParamsFromJson(json);

   Map<String, dynamic> toJson() => _$EditImageCarParamsToJson(this);
}


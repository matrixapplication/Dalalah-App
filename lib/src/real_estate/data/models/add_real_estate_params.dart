import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import '../../../sell_car/data/models/sell_car_params.dart';

part 'add_real_estate_params.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class AddRealEstateParams {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'prop_status')
  String? status;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'price')
  dynamic price;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'street_name')
  String? streetName;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'lng')
  String? lng;
  @JsonKey(name: 'cover')
  @FileJsonConverter()
  File? cover;
  @JsonKey(name: 'images')
  @FileJsonConverter()
  List<File>? images;
  @JsonKey(name: 'features')
  List<int>? features;
  @JsonKey(name: 'details[]')
  List<DetailsItemModelDto>? detailsList;


  AddRealEstateParams(
      {this.title,
      this.type,
      this.status,
      this.categoryId,
      this.price,
      this.description,
      this.cityId,
      this.streetName,
      this.lat,
      this.lng,
      this.cover,
      this.images,
      this.features,
      this.detailsList,
      });

  factory AddRealEstateParams.fromJson(Map<String, dynamic> json) => _$AddRealEstateParamsFromJson(json);

   Map<String, dynamic> toJson() => _$AddRealEstateParamsToJson(this);
}

@JsonSerializable()
class DetailsItemModelDto {
  final int? id;
  final String? title;

  DetailsItemModelDto({this.id, this.title});

  factory DetailsItemModelDto.fromJson(Map<String, dynamic> json) => _$DetailsItemModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsItemModelDtoToJson(this);
}


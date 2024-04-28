import 'package:json_annotation/json_annotation.dart';

import '../../../profile/data/models/profile_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';

part 'plate_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class PlateDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'letter_ar')
  String? letterAr;
  @JsonKey(name: 'letter_en')
  String? letterEn;
  @JsonKey(name: 'plate_number')
  dynamic plateNumber;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'plate_type')
  String? plateType;
  @JsonKey(name: 'bought_status')
  String? boughtStatus;
  @JsonKey(name: 'ad_type')
  String? adType;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'is_featured')
  bool? isFeatured;
  @JsonKey(name: 'is_sold')
  bool? isSold;
  @JsonKey(name: 'is_hide')
  bool? isHide;
  @JsonKey(name: 'is_approved')
  bool? isApproved;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'user')
  ProfileDto? user;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;
  @JsonKey(name: 'user_car_status')
  int? userCarStatus;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'lat')
  double? lat;
  @JsonKey(name: 'lng')
  double? lng;


  PlateDto({this.id, this.letterAr, this.letterEn, this.plateNumber, this.price, this.plateType, this.boughtStatus, this.adType, this.address,  this.isSold, this.isFeatured, this.isHide,this.isApproved, this.city, this.user, this.isFavorite, this.userCarStatus, this.createdAt, this.lat, this.lng});

   factory PlateDto.fromJson(Map<String, dynamic> json) => _$PlateDtoFromJson(json);

   Map<String, dynamic> toJson() => _$PlateDtoToJson(this);
}


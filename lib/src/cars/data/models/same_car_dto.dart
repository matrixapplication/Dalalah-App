import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/car_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';
import '../../../showrooms/data/models/showroom_dto.dart';

part 'same_car_dto.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class SameCarDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'model_role')
  String? modelRole;
  @JsonKey(name: 'showroom')
  ShowroomDto? showroom;
  @JsonKey(name: 'city')
  CityDto? city;
  @JsonKey(name: 'price')
  String? price;
  @JsonKey(name: 'monthly_installment')
  int? monthlyInstallment;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'main_image')
  String? mainImage;
  @JsonKey(name: 'images')
  List<ImageDto>? images;

  SameCarDto({this.id, this.modelRole, this.showroom, this.city, this.price, this.monthlyInstallment, this.description, this.mainImage, this.images});

   factory SameCarDto.fromJson(Map<String, dynamic> json) => _$SameCarDtoFromJson(json);

   Map<String, dynamic> toJson() => _$SameCarDtoToJson(this);
}
//
// @JsonSerializable(ignoreUnannotated: false)
// class ShowroomDto {
//   @JsonKey(name: 'id')
//   int? id;
//   @JsonKey(name: 'owner_name')
//   String? ownerName;
//   @JsonKey(name: 'showroom_name')
//   String? showroomName;
//   @JsonKey(name: 'description')
//   String? description;
//   @JsonKey(name: 'code')
//   String? code;
//   @JsonKey(name: 'phone')
//   String? phone;
//   @JsonKey(name: 'whatsapp')
//   String? whatsapp;
//   @JsonKey(name: 'end_tax_card')
//   String? endTaxCard;
//   @JsonKey(name: 'role')
//   String? role;
//   @JsonKey(name: 'count_cars')
//   int? countCars;
//   @JsonKey(name: 'address')
//   String? address;
//   @JsonKey(name: 'is_blocked')
//   bool? isBlocked;
//   @JsonKey(name: 'image')
//   String? image;
//   @JsonKey(name: 'cover_image')
//   String? coverImage;
//
//   ShowroomDto({this.id, this.ownerName, this.showroomName, this.description, this.code, this.phone, this.whatsapp, this.endTaxCard, this.role, this.countCars, this.address, this.isBlocked, this.image, this.coverImage});
//
//    factory ShowroomDto.fromJson(Map<String, dynamic> json) => _$ShowroomDtoFromJson(json);
//
//    Map<String, dynamic> toJson() => _$ShowroomDtoToJson(this);
// }

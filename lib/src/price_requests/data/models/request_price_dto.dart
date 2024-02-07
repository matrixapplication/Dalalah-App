import 'package:json_annotation/json_annotation.dart';

import '../../../cars/data/models/comment_dto.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../showrooms/data/models/showroom_dto.dart';

part 'request_price_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class RequestPriceDto {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'user')
  User? user;
  @JsonKey(name: 'showroom')
  ShowroomDto? showroom;
  @JsonKey(name: 'car')
  CarDto? car;

  RequestPriceDto({this.id, this.createdAt, this.user, this.showroom, this.car});

   factory RequestPriceDto.fromJson(Map<String, dynamic> json) => _$RequestPriceDtoFromJson(json);

   Map<String, dynamic> toJson() => _$RequestPriceDtoToJson(this);
}
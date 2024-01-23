
import '../../../cars/data/models/comment_dto.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../home/domain/entities/car.dart';
import '../../../showrooms/data/models/showroom_dto.dart';
import '../../../showrooms/domain/entities/showroom.dart';
import '../../data/models/request_price_dto.dart';

class RequestPrice {
  int? id;
  String? createdAt;
  User? user;
  Showroom? showroom;
  Car? car;

  RequestPrice({this.id, this.createdAt, this.user, this.showroom, this.car});

   factory RequestPrice.fromJson(RequestPriceDto json) {
    return RequestPrice(
      id: json.id,
      createdAt: json.createdAt,
      user: json.user,
      showroom: Showroom.fromDto(json.showroom ?? ShowroomDto()),
      car: Car.fromDto(json.car ?? CarDto()),
    );
   }
}
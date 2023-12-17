
import '../../../profile/data/models/profile_dto.dart';
import '../../../sell_car/data/models/city_dto.dart';
import '../../data/models/plate_dto.dart';


class Plate {
  int? id;
  String? letterAr;
  String? letterEn;
  String? plateNumber;
  String? price;
  String? plateType;
  String? boughtStatus;
  String? adType;
  String? address;
  String? isHide;
  String? isPaused;
  String? isApproved;
  CityDto? city;
  ProfileDto? user;
  bool? isFavorite;
  String? createdAt;

  Plate({this.id, this.letterAr, this.letterEn, this.plateNumber, this.price, this.plateType, this.boughtStatus, this.adType, this.address, this.isHide, this.isPaused, this.isApproved, this.city, this.user, this.isFavorite, this.createdAt});

   factory Plate.fromDto(PlateDto json) {
     return Plate(
       id: json.id,
       letterAr: json.letterAr,
       letterEn: json.letterEn,
       plateNumber: json.plateNumber.toString(),
       price: json.price,
       plateType: json.plateType,
       boughtStatus: json.boughtStatus,
       adType: json.adType,
       address: json.address,
       isHide: json.isHide,
       isPaused: json.isPaused,
       isApproved: json.isApproved,
       city: json.city,
       user: json.user,
        isFavorite: json.isFavorite,
       createdAt: json.createdAt,
     );
   }
}


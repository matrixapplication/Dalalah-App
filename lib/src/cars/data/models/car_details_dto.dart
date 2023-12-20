import 'package:dalalah/src/cars/data/models/same_car_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/car_dto.dart';


part 'car_details_dto.g.dart'; 

@JsonSerializable(ignoreUnannotated: false)
class CarDetailsDto {
  @JsonKey(name: 'car')
  CarDto? carDetails;
  @JsonKey(name: 'same_cars')
  List<SameCarDto>? sameCars;
  @JsonKey(name: 'related_cars')
  List<CarDto>? relatedCars;

  CarDetailsDto({this.sameCars, this.relatedCars, this.carDetails});

   factory CarDetailsDto.fromJson(Map<String, dynamic> json) => _$CarDetailsDtoFromJson(json);

   Map<String, dynamic> toJson() => _$CarDetailsDtoToJson(this);
}


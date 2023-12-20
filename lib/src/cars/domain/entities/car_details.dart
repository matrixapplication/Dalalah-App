
import 'package:dalalah/src/cars/data/models/model_object.dart';
import 'package:dalalah/src/cars/domain/entities/same_car.dart';

import '../../../home/data/models/brand_dto.dart';
import '../../../home/data/models/car_dto.dart';
import '../../../home/domain/entities/brand.dart';
import '../../../home/domain/entities/car.dart';
import '../../../main_index.dart';
import '../../../sell_car/data/models/body_type_dto.dart';
import '../../../sell_car/data/models/brand_model_dto.dart';
import '../../../sell_car/data/models/brand_model_extension_dto.dart';
import '../../../sell_car/data/models/car_status_dto.dart';
import '../../../sell_car/data/models/color_dto.dart';
import '../../../sell_car/data/models/drive_type_dto.dart';
import '../../../sell_car/data/models/fuel_type_dto.dart';
import '../../../sell_car/domain/entities/body_type.dart';
import '../../../sell_car/domain/entities/brand_model.dart';
import '../../../sell_car/domain/entities/brand_model_extension.dart';
import '../../../sell_car/domain/entities/car_status.dart';
import '../../../sell_car/domain/entities/drive_type.dart';
import '../../../sell_car/domain/entities/feature.dart';
import '../../../sell_car/domain/entities/fuel_type.dart';
import '../../data/models/car_details_dto.dart';
import '../../presentation/cars_details/widgets/car_properties.dart';

class CarDetails {
  Car? car;
  List<SameCar>? sameCars;
  List<Car>? relatedCars;

  CarDetails(
      {this.car,
      this.sameCars,
      this.relatedCars,
      });

  factory CarDetails.fromDto(CarDetailsDto json) {
    return CarDetails(
      car: Car.fromDto(json.carDetails ?? CarDto()),
      sameCars: json.sameCars?.map((e) => SameCar.fromDto(e)).toList() ?? [],
      relatedCars: json.relatedCars?.map((e) => Car.fromDto(e)).toList() ?? [],
    );
  }

  List<CarProperty> properties(BuildContext context) {
     List<CarProperty> properties = [
       CarProperty(
         title: car?.status?.name ?? '',
         subtitle: context.strings.type,
         icon: AppIcons.sedan_car_model,
       ),
       CarProperty(
         title: car?.year?? '',
         subtitle: context.strings.year,
         icon: AppIcons.sedan_car_model,
       ),
       CarProperty(
         title: car?.color?? '',
         subtitle: context.strings.color,
         icon: AppIcons.sedan_car_model,
       ),
       CarProperty(
         title: car?.cylinders?? '',
         subtitle: context.strings.cylinders,
         icon: AppIcons.sedan_car_model,
       ),
      CarProperty(
        title: car?.bodyType?.name ?? '',
        subtitle: context.strings.body_shape,
        icon: AppIcons.sedan_car_model,
      ),
      CarProperty(
        title: car?.fuelType?.name ?? '',
        subtitle: context.strings.fuel_type,
        icon: AppIcons.gas_station,
      ),
      CarProperty(
        title: car?.driveType?.name ?? '',
        subtitle: context.strings.transmission,
        icon: AppIcons.transmission,
      ),
      CarProperty(
        title: '${car?.mileage ?? ''} ${context.strings.km}',
        subtitle: context.strings.kilometers,
        icon: AppIcons.sedan_car_model,
      ),
      CarProperty(
        title: '${car?.engine ?? ''} ${context.strings.cc}',
        subtitle: context.strings.engine_capacity,
        icon: AppIcons.sedan_car_model,
      ),
    ];
     properties.removeWhere((element) => element.title == '' || element.title == '0 KM');
     return properties;
  }

  List<String> allImages(){
    return  [car?.mainImage ?? '', ...car?.images?.map((e) => e ?? '') ?? []];
  }
}

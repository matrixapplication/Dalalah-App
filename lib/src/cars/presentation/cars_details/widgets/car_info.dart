import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/main_index.dart';

import '../../../../home/domain/entities/car.dart';
import '../../../../home/presentation/widgets/cars_home_list.dart';
import '../../../../sell_car/data/models/feature_dto.dart';
import 'border_widget.dart';
import 'header_car_details.dart';

///  Created by harby on 9/6/2023.
class CarInfo extends StatelessWidget {
  final bool isNew;
  final Car car;
  const CarInfo({Key? key, required this.car, required this.isNew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarDetailsContainer(
            label: car.fuelType?.name ?? "",
            icon: AppIcons.fuel,
          ),
          5.pw,
          if(!isNew)
          CarDetailsContainer(
            label: car.mileage ?? "",
            icon: AppIcons.timer,
          ),
          5.pw,
          CarDetailsContainer(
            label: car.cylinders ?? "",
            icon: AppIcons.cylinder,
          ),
        ],
      ),
    );
  }
}

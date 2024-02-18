
import 'package:dalalah/core/utils/helper_methods.dart';

import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../../../../showrooms/presentation/showroom_details/widgets/new_car_item.dart';
import '../widgets/cars_vertical_item.dart';

class CarsScreen extends BaseStatelessWidget {
  final bool isMyCar;
  final bool isCarDetails;
  final List<Car> cars;
  final Function(int)? onToggleFavorite;
  final Function(int)? onHide;
  final Function(int)? onSold;
  final Function(int)? onSpecial;
  final Function(int)? onRequestPrice;
  final Function(int)? onDelete;

  CarsScreen({Key? key, required this.cars,  this.isMyCar = false, this.onToggleFavorite, this.onHide, this.onSold, this.onSpecial, this.onRequestPrice, this.isCarDetails = false, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: false,
      future: HelperMethods.isUser(),
      builder: (context, snapshot) {
        bool isUser = snapshot.data as bool;
        return ListView.builder(
          // itemCount: tasks.length,
          itemCount: cars.length,
          shrinkWrap: true,
          padding: 10.paddingHoriz + 10.paddingTop,
          controller: ScrollController(),
          itemBuilder: (context, index) {
            bool isNew = (cars[index].status?.key == CarStatus.newCar && !isCarDetails && !isMyCar && isUser);
            return
              isNew ? NewCarItem(
              car: cars[index],
              onToggleFavorite: onToggleFavorite,
              onRequestPrice: onRequestPrice,
            ) :
              CarVerticalItem(
              imageHasOnlyTopRadius: false,
              isMyCar: isMyCar,
              car: cars[index],
              onToggleFavorite: onToggleFavorite,
              onHide: onHide,
              onSold: onSold,
              onSpecial: onSpecial,
              onRequestPrice: onRequestPrice,
              onDelete: onDelete,
            );
          },
        );
      }
    );
  }
}

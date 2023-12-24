

import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../widgets/cars_vertical_item.dart';

class CarsScreen extends BaseStatelessWidget {
  final bool isFilter;
  final bool isAds;
  final List<Car> cars;
  final Function(int)? onToggleFavorite;

  CarsScreen({Key? key, required this.cars, required this.isFilter, this.isAds = false, this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: tasks.length,
      itemCount: cars.length,
      shrinkWrap: true,
      padding: 10.paddingHoriz + 10.paddingTop,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return CarVerticalItem(
          imageHasOnlyTopRadius: false,
            index: index,
          isAds: isAds,
          car: cars[index],
          onToggleFavorite: onToggleFavorite,
          // task: tasks[index],
        );
      },
    );
  }
}


import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../widgets/brands_filter.dart';
import '../widgets/cars_vertical_item.dart';

class CarsScreen extends BaseStatelessWidget {
  final bool isFilter;
  final bool isNew;
  final bool isAds;
  final List<Car> tasks;
  final Function(int)? onToggleFavorite;

  CarsScreen({Key? key, required this.tasks, required this.isFilter, this.isNew = true, this.isAds = false, this.onToggleFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build isNew: $isNew');
    return ListView.builder(
      // itemCount: tasks.length,
      itemCount: tasks.length,
      shrinkWrap: true,
      padding: 10.paddingHoriz + 10.paddingTop,
      controller: ScrollController(),
      itemBuilder: (context, index) {
        return CarVerticalItem(
          imageHasOnlyTopRadius: false,
            index: index,
          isNew: isNew,
          isAds: isAds,
          car: tasks[index],
          onToggleFavorite: onToggleFavorite,
          // task: tasks[index],
        );
      },
    );
  }
}

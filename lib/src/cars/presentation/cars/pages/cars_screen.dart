
import '../../../../home/domain/entities/car.dart';
import '../../../../main_index.dart';
import '../widgets/brands_filter.dart';
import '../widgets/cars_vertical_item.dart';

class CarsScreen extends BaseStatelessWidget {
  final bool isFilter;
  final bool isNew;
  final bool isAds;
  final List<Car> tasks;

  CarsScreen({Key? key, required this.tasks, required this.isFilter, this.isNew = true, this.isAds = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build isNew: $isNew');
    return Material(
      color: context.scaffoldBackgroundColor,
      child: Column(
        children: [
          if (isFilter) ...[
            10.ph,
            //FilterHome(isDecoration: false),
            BrandsFilter(
              items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
                  .map((e) => e.toString())
                  .toList(),
              onFilter: (value) {},
            ),
          ],
          Expanded(
            child: ListView.builder(
              // itemCount: tasks.length,
              itemCount: 5,
              shrinkWrap: true,
              padding: 10.paddingHoriz + 10.paddingTop,
              itemBuilder: (context, index) {
                return  CarVerticalItem(
                  imageHasOnlyTopRadius: false,
                    index: index,
                  isNew: isNew,
                  isAds: isAds,
                  car: Car(),
                  // task: tasks[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

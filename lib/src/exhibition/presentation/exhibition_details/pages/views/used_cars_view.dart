import '../../../../../cars/presentation/cars/widgets/cars_vertical_item.dart';
import '../../../../../main_index.dart';
import '../../widgets/new_car_item.dart';

class UsedCarsView extends BaseStatelessWidget {
  UsedCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 20.paddingVert + 12.paddingHoriz,
      itemCount: 5,
      itemBuilder: (context, index) {
        return CarVerticalItem(
          carStatus: strings.used,
          isNew: false,
        );
      },
    );
  }
}

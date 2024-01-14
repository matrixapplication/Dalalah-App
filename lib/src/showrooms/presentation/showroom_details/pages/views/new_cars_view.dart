import 'package:dalalah/src/home/domain/entities/car.dart';

import '../../../../../main_index.dart';
import '../../widgets/new_car_item.dart';

class NewCarsView extends BaseStatelessWidget {
  NewCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 20.paddingVert + 10.paddingHoriz,
      itemCount: 5,
      itemBuilder: (context, index) {
        return NewCarItem(
          car:  Car(),
        );
      },
    );
  }
}

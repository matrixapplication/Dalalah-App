

import '../../../../cars/presentation/cars/widgets/cars_vertical_item.dart';
import '../../../../main_index.dart';

class FavouriteCarsView extends StatelessWidget {
  const FavouriteCarsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: 5,
      itemBuilder: (context, index) {
        return const CarVerticalItem();
      },
    );
  }
}

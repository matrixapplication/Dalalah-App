import '../../../../main_index.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/widgets/plate_item.dart';

class FavouritePlatesView extends BaseStatelessWidget {
  final bool isAddView;

  FavouritePlatesView({
    super.key,
    required this.isAddView,
  });

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 5,
      padding: 16.paddingAll,
      itemBuilder: (context, index) {
        return PlateItem(
          plate: Plate(),
          isFavouriteView: true,
          isAddView: isAddView,
        );
      },
    );
  }
}

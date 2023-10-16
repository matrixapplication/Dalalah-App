import '../../../../cars/presentation/cars/widgets/cars_vertical_item.dart';
import '../../../../main_index.dart';

class FavouriteAndAdsCarsView extends StatelessWidget {
  final bool isAddView;

  const FavouriteAndAdsCarsView({
    super.key,
    required this.isAddView,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: 15.paddingAll,
      itemCount: 5,
      itemBuilder: (context, index) {
        return CarVerticalItem(
          isFavouriteView: true,
          isAddView: isAddView,
        );
      },
    );
  }
}

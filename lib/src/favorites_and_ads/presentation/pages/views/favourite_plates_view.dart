import '../../../../main_index.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/widgets/plate_item.dart';

// import '../../../domain/entities/plate.dart';
class FavouritePlatesView extends BaseStatelessWidget {
  final bool isAddView;

  FavouritePlatesView({
    super.key,
    required this.isAddView,
  });

  @override
  Widget build(BuildContext context) {
    List<Plate> plates = [
      Plate(
        id: '1',
        name: ' ب ط ل 8888',
        image:
            'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
        price: '800,000',
      ),
      Plate(
        id: '1',
        name: ' ب ط ل 8888',
        image:
            'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
        price: '800,000',
      ),
      Plate(
        id: '1',
        name: ' ب ط ل 8888',
        image:
            'https://i0.wp.com/almrj3.com/wp-content/uploads/2022/01/6.jpg?resize=520%2C288&ssl=1',
        price: '800,000',
      ),
    ];

    return ListView.builder(
      itemCount: plates.length,
      padding: 16.paddingAll,
      itemBuilder: (context, index) {
        return PlateItem(
          plate: plates[index],
          isFavouriteView: true,
          isAddView: isAddView,
        );
      },
    );
  }
}

import '../../../../main_index.dart';

class FavouriteBuildingView extends BaseStatelessWidget {
  final bool isFavouriteView;

  FavouriteBuildingView({
    super.key,
    required this.isFavouriteView,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        strings.soon,
        style: context.headlineLarge!.copyWith(
          fontSize: 34,
        ),
      ),
    );
  }
}

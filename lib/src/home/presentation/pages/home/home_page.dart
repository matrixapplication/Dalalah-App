import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../bloc/home_bloc.dart';
import 'home_screen.dart';

class HomePage extends BaseBlocWidget<UnInitState, HomeCubit> {
  HomePage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: context.height * 0.4,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: context.primaryColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                  ),
                ),
              ),
            ),
            Container(
              height: context.height * 0.5,
              width: double.infinity,
              color: context.cardColor,
            ),
          ],
        ),
        buildConsumer(context),
      ],
    );
  }

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return HomeScreen(
      slidesStream: bloc.slidesStream,
      brandsStream: bloc.brandsStream,
      yourCarsStream: bloc.yourCarsStream,
      platesStream: bloc.otherCarsStream,
      onFavoriteCar: (id) async => await bloc.toggleFavorite(id),
      onFavoritePlate: (id) async => await bloc.toggleFavoritePlate(id),
      onSearch: (value) => bloc.fetchCarsBySearch(value),
      onToggleFavorite: (id) => bloc.toggleFavorite(id),
    );
  }
}

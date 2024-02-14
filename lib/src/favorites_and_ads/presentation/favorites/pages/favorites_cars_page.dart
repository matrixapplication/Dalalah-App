import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/domain/entities/car.dart';
import '../bloc/favorite_cars_bloc.dart';

class FavoriteCarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, FavoriteCarsCubit> {
  FavoriteCarsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavoriteCars();
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    return CarsScreen(
      cars: state.data ?? [],
      onToggleFavorite: (id) => bloc.toggleFavoriteCar(id),
      onRequestPrice: (id) {
        bloc.requestPrice(id);
      },
    );
    // return 0.ph;
  }

  // @override
  // String? title(BuildContext context) {
  //   return strings.cars;
  // }
  //
  // @override
  // onAddButtonPressed() {
  //   pushNamed(Routes.sellCarPage);
  // }
  //
  //
  // @override
  // bool isAddButton() {
  //   return true;
  // }
}


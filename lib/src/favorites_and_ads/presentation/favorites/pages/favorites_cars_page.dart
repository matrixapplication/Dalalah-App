import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../cars/presentation/cars/bloc/cars_bloc.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/data/models/car_filter_params.dart';
import '../../../../home/domain/entities/car.dart';
import '../bloc/favorite_cars_bloc.dart';

class CarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, FavoriteCarsCubit> {
  CarsPage({Key? key}) : super(key: key);

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
      isFilter: false,
      isNew: true,
      tasks: state.data ?? [],
    );
    // return 0.ph;
  }

  @override
  String? title(BuildContext context) {
    return strings.cars;
  }

  @override
  onAddButtonPressed() {
    Navigators.pushNamed(Routes.sellCarPage);
  }


  @override
  bool isAddButton() {
    return true;
  }
}

class CarsPageArgs {
  final String? paramsFilter;
  final String? categoryName;
  final String? categoryID;

  CarsPageArgs({this.paramsFilter, this.categoryName, this.categoryID});
}

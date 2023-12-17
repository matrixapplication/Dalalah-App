import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../cars/presentation/cars/bloc/cars_bloc.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/data/models/car_filter_params.dart';
import '../../../../home/domain/entities/car.dart';

class MyCarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, CarsCubit> {
  MyCarsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCars(CarFilterParams());
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

  //
  // @override
  // onAddButtonPressed() {
  //   Navigators.pushNamed(Routes.sellCarPage);
  // }
  //
  //
  // @override
  // bool isAddButton() {
  //   return true;
  // }
}
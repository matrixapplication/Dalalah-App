import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/domain/entities/car.dart';
import '../../../../sell_car/domain/entities/car_status.dart';
import '../bloc/showroom_cars_bloc.dart';

class ShowroomCarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, ShowroomCarsCubit> {
  final int id;
  final String status;
  ShowroomCarsPage({Key? key, required this.id, this.status = CarStatus.newCar}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchShowroomCars(status, id);
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    return PaginationWidget(
      refreshController: bloc.refreshController,
      onRefresh: () {
        bloc.fetchShowroomCars(status, id);
      },
      onLoading: () async {
        await bloc.fetchShowroomCars(status, id,isRefresh: false);
      },
      child: CarsScreen(
        isMyCar: false,
        cars: state.data ?? [],
        onToggleFavorite: (id) {
          bloc.toggleCarFavorite(id);
        },
        onRequestPrice: (id) {
          bloc.requestCarPrice(id);
        },
      ),
    );
  }
}
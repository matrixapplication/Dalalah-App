import 'package:dalalah/src/main_index.dart';
import 'package:dalalah/src/showrooms/domain/entities/showroom.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
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
    bloc.fetchMyCars(status, id);
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    if (bloc.isLastPage) {
      refreshController.loadNoData();
    }
    return PaginationWidget(
      refreshController: refreshController,
      onRefresh: () {
        bloc.fetchMyCars(status, id);
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchMyCars(status, id, isMoreData: true);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child: CarsScreen(
        isFilter: false,
        isAds: false,
        cars: state.data ?? [],
        onToggleFavorite: (id) {
          bloc.toggleCarFavorite(id);
        },
      ),
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
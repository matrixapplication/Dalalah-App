import 'package:dalalah/src/main_index.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../cars/data/models/update_car_date_params.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/domain/entities/car.dart';
import '../bloc/my_cars_bloc.dart';

class MyCarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, MyCarsCubit> {
  final bool isHidePayment;
  MyCarsPage({Key? key, required this.isHidePayment}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchMyCars();
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    print('isShowPayment $isHidePayment');
    if (bloc.isLastPage) {
      print('isLastPage ${bloc.isLastPage}');
      refreshController.loadNoData();
    }
    return PaginationWidget(
      refreshController: refreshController,
      onRefresh: () {
        bloc.fetchMyCars();
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchMyCars(isRefresh: false);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          print('isLastPage ${bloc.isLastPage}');
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child: CarsScreen(
        isMyCar: true,
        isHidePayment: isHidePayment,
        cars: state.data ?? [],
        onHide: (id) {
          bloc.hideCar(id);
        },
        onSold: (id) {
          bloc.soldCar(id);
        },
        onSpecial: (id) {
          bloc.addSpecialCar(id);
        },
        onDelete: (id) {
          bloc.deleteCar(id);
        },
        onUpdateDate: (id) {
          bloc.updateCarDate(id);
        },
      ),
    );
    // return 0.ph;
  }

  @override
  void onSuccessDismissed() {
    loadInitialData(context!);
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

import 'package:dalalah/src/main_index.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../cars/presentation/cars/pages/cars_screen.dart';
import '../../../../home/domain/entities/car.dart';
import '../bloc/my_cars_bloc.dart';

class MyCarsPage extends BaseBlocWidget<DataSuccess<List<Car>>, MyCarsCubit> {
  MyCarsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchMyCars(isMoreData: true);
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
        await bloc.fetchMyCars(isMoreData: true);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          print('isLastPage ${bloc.isLastPage}');
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child: CarsScreen(
        isFilter: false,
        isAds: true,
        cars: state.data ?? [],
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
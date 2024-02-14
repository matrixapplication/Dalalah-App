import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/widgets/pagination/pagination_widget.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../main_index.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/pages/plates_screen.dart';
import '../bloc/my_plates_bloc.dart';

class MyPlatesPage
    extends BaseBlocWidget<DataSuccess<List<Plate>>, MyPlatesCubit> {
  MyPlatesPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchMyPlates();
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    if (bloc.isLastPage) {
      print('isLastPage ${bloc.isLastPage}');
      refreshController.loadNoData();
    }
    return PaginationWidget(
      refreshController: refreshController,
      onRefresh: () {
        loadInitialData(context);
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchMyPlates(isRefresh: false);
        // await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          print('isLastPage ${bloc.isLastPage}');
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child: PlatesScreen(
        plates: state.data ?? [],
        onFavoritePlate: (id) => bloc.toggleFavoritePlate(id),
        isMyPlate: true,
        onHide: (id) => bloc.hidePlate(id),
        onSold: (id) => bloc.soldPlate(id),
        //onSpecial: (id) => bloc.(id),
      ),
    );
  }
//
// @override
// onAddButtonPressed() {
//   pushNamed(Routes.plateFilterPage, arguments: true);
// }
//
// @override
// bool isAddButton() {
//   return true;
// }

@override
  void onSuccessDismissed() {
    loadInitialData(context!);
  }
}

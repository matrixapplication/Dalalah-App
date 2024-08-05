import 'package:dalalah/src/main_index.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../real_estate/data/models/my_properties_response.dart';
import '../bloc/my_real_estate_bloc.dart';
import 'my_real_estates_screen.dart';

class MyRealEstatesPage extends BaseBlocWidget<DataSuccess<List<Property>>, MyRealEstateCubit> {
  final bool isHidePayment;
  MyRealEstatesPage({Key? key, required this.isHidePayment}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchMyRealEstates();
  }



  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Property>> state) {
    print('isShowPayment $isHidePayment');
    if (bloc.isLastPage) {
      print('isLastPage ${bloc.isLastPage}');
      refreshController.loadNoData();
    }
    return PaginationWidget(
      refreshController: refreshController,
      onRefresh: () {
        bloc.fetchMyRealEstates();
        refreshController.refreshCompleted();
      },
      onLoading: () async {
        await bloc.fetchMyRealEstates(isRefresh: false);
        await Future.delayed(const Duration(milliseconds: 1200));
        if (bloc.isLastPage) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
      },
      child:
      MyRealEstateScreen(
        properties: state.data!,
        isMyProperty: true,
        isHidePayment: isHidePayment,
        onHide: (id) {
          bloc.hideProperty(id);
        },
        onSold: (id) {
          bloc.soldProperty(id);
        },
        onSpecial: (id) {
          bloc.addSpecialProperty(id);
        },
        onDelete: (id) {
          bloc.deleteProperty(id);
        },
        onUpdateDate: (id) {
          bloc.updatePropertyDate(id);
        },
      )
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

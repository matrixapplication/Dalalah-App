
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';
import 'package:dalalah/src/plates/domain/entities/plate_args.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/pagination/pagination_widget.dart';
import '../../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../../main_index.dart';
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/entities/plate.dart';
import '../../../domain/entities/plate_types.dart';
import '../bloc/plates_bloc.dart';
import 'plates_screen.dart';


class PlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, PlatesCubit> {
  final bool isFilter;
  PlatesPage({Key? key, this.isFilter = true}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchPlates(getArguments(context) ?? PlateFilterParams(plateType: type));
  }


  @override
  String? title(context)=> isFilter ? strings.plates : null;

  String type = PlateTypes.private;


  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }


  @override
  Function()? onTabSelected(index) {
    type = index == 0 ? PlateTypes.private : PlateTypes.transfer;
    bloc.fetchPlates(getArguments(context!) ?? PlateFilterParams(plateType: type));
    return null;
  }
  PlateFilterParams params = PlateFilterParams(plateType: PlateTypes.private);
  @override
  Widget build(BuildContext context) {

    return mainFrame(
      body: Column(
        children: [
          if(isFilter && getArguments(context) == null)
          FilterHome(
            routeName: Routes.plateFilterPage,
            arguments: PlateArgs(isFilter: true),
            onFilterOrder: (filterOrder){
              params = getArguments(context) ?? PlateFilterParams(plateType: type);
              params.order = filterOrder;
              bloc.fetchPlates(params);
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
      tabs: [
        TabModel(label: context.strings.plate_private),
        TabModel(label: context.strings.plate_transfer),
      ],
    );
  }


  RefreshController refreshController = RefreshController();
  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    if (bloc.isLastPage) {
      refreshController.loadNoData();
    }
    return PaginationWidget(
        refreshController: refreshController,
        onRefresh: () async {
          await bloc.fetchPlates(params);
        },
        onLoading: () async {
          await bloc.fetchPlates(params, isRefresh: false);
          Future.delayed(Duration(milliseconds: 5000), () {
            refreshController.loadComplete();
          });
        },
        child: PlatesScreen(plates: state.data ?? [], onFavoritePlate: (id) => bloc.toggleFavorite(id)));
  }

  @override
  onAddButtonPressed() {
    HelperMethods.isAuth().then((value) {
      if(value == true) {
        pushNamed(Routes.plateFilterPage);
      } else {
        DialogsManager.showInfoDialogToLogin();
      }
    });
    return null;
  }

  @override
  bool isAddButton() {
    return true;
  }

  @override
  void onSuccessDismissed() {
    bloc.fetchPlates(params);
  }
}


import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/plate_filter_params.dart';
import '../../../domain/entities/plate.dart';
import '../bloc/plates_bloc.dart';
import 'plates_screen.dart';


class PlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, PlatesCubit> {
  final bool isFilter;
  PlatesPage({Key? key, this.isFilter = true}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchPlates(getArguments(context) ?? PlateFilterParams());
  }


  @override
  String? title(context)=> isFilter ? strings.plates : null;

  @override
  Widget build(BuildContext context) {

    return mainFrame(
      body: Column(
        children: [
          if(isFilter && getArguments(context) == null)
          FilterHome(
            routeName: Routes.plateFilterPage,
            onFilterOrder: (filterOrder){
              PlateFilterParams params = getArguments(context) ?? PlateFilterParams();
              params.order = filterOrder;
              bloc.fetchPlates(params);
            },
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }


  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return PlatesScreen(plates: state.data ?? [], onFavoritePlate: (id) => bloc.toggleFavorite(id));
  }

  @override
  onAddButtonPressed() {
    HelperMethods.isAuth().then((value) {
      if(value == true) {
        pushNamed(Routes.plateFilterPage, arguments: true);
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
}

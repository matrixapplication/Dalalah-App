
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/bloc/plates_bloc.dart';
import '../../../../plates/presentation/plates/pages/plates_screen.dart';


class PlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, PlatesCubit> {
  final bool isFilter;
  PlatesPage({Key? key, this.isFilter = true}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }


  @override
  String? title(context)=> isFilter ? strings.plates : null;

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: Column(
        children: [
          if(isFilter ?? true)
          FilterHome(
            routeName: Routes.plateFilterPage,
            onFilterOrder: (){},
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
    );
  }


  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return PlatesScreen(plates: state.data ?? []);
  }

  @override
  onAddButtonPressed() {
    Navigators.pushNamed(Routes.plateFilterPage, arguments: true);
  }

  @override
  bool isAddButton() {
    return true;
  }
}

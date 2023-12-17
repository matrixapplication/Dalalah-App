
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/bloc/plates_bloc.dart';
import '../../../../plates/presentation/plates/pages/plates_screen.dart';


class MyPlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, PlatesCubit> {
  MyPlatesPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavorites();
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return PlatesScreen(plates: state.data ?? []);
  }
  //
  // @override
  // onAddButtonPressed() {
  //   Navigators.pushNamed(Routes.plateFilterPage, arguments: true);
  // }
  //
  // @override
  // bool isAddButton() {
  //   return true;
  // }
}

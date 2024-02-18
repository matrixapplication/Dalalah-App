
import 'package:dalalah/core/components/base_widget_bloc.dart';
import 'package:dalalah/src/home/presentation/widgets/filter_home.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../../plates/domain/entities/plate.dart';
import '../../../../plates/presentation/plates/bloc/plates_bloc.dart';
import '../../../../plates/presentation/plates/pages/plates_screen.dart';
import '../bloc/favorite_plates_bloc.dart';


class FavoritePlatesPage extends BaseBlocWidget<DataSuccess<List<Plate>>, FavoritePlatesCubit> {
  FavoritePlatesPage({Key? key}) : super(key: key);


  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchFavoriteCars();
  }


  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Plate>> state) {
    return PlatesScreen(plates: state.data ?? [], onFavoritePlate: (id) => bloc.toggleFavoriteCar(id));
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
}

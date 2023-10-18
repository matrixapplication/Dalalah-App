import 'package:delala/src/cars/presentation/cars/bloc/cars_search_bloc.dart';
import 'package:delala/src/main_index.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import 'cars_search_screen.dart';

class CarsSearchPage extends BaseBlocWidget<UnInitState, CarsSearchCubit> {
  CarsSearchPage({Key? key}) : super(key: key);

  // @override
  // void loadInitialData(BuildContext context) {}

  @override
  Widget buildWidget(BuildContext context, UnInitState state) {
    return CarsSearchScreen();
  }

  @override
  String? title(BuildContext context) {
    return strings.detailed_research;
  }
}

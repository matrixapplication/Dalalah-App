import 'package:dalalah/src/main_index.dart';
import '../../../../../../core/components/base_widget_bloc.dart';
import '../bloc/cars_search_bloc.dart';
import '../bloc/cars_search_state.dart';
import 'cars_search_screen.dart';

class CarsSearchPage extends BaseBlocWidget<CarsSearchState, CarsSearchCubit> {
  CarsSearchPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchInitialData();
  }

  @override
  Widget buildWidget(BuildContext context, CarsSearchState state) {
    return CarsSearchScreen(
      state: state,
      onFetchBrandModels: (id) {
        bloc.fetchBrandModels(id);
      },
      onFetchBrandModelsExtension: (id) {
        bloc.fetchBrandModelExtensions(id);
      },
    );
  }

  @override
  String? title(BuildContext context) {
    return strings.detailed_research;
  }
}

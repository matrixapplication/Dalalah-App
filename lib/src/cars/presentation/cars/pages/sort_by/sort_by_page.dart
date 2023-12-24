import 'package:dalalah/src/main_index.dart';

import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../../home/data/models/car_filter_params.dart';
import '../../../../../home/domain/entities/car.dart';
import '../../bloc/cars_bloc.dart';
import '../cars_screen.dart';

class SortByPage extends BaseBlocWidget<DataSuccess<List<Car>>, CarsCubit> {
  SortByPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchCars(CarFilterParams());
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: TabBarScaffoldWidget(
        marginTabs: 10.paddingTop + 10.paddingHoriz,
        tabs: [
          TabItemModel(
            label: context.strings.ascending,
            page: buildConsumer(context),
          ),
          TabItemModel(
            label: context.strings.descending,
            page: buildConsumer(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Car>> state) {
    return CarsScreen(
      isFilter: false,
      cars: state.data ?? [],
    );
  }

  @override
  String? title(BuildContext context) {
    return context.strings.sort_by;
  }
}

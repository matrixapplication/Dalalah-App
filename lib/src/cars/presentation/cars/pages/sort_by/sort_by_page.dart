import 'package:dalalah/src/main_index.dart';

import '../../../../../../core/components/base_widget_bloc.dart';
import '../../../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../domain/entities/tasks.dart';
import '../../bloc/cars_bloc.dart';
import '../cars_screen.dart';

class SortByPage extends BaseBlocWidget<DataSuccess<List<Task>>, CarsCubit> {
  SortByPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return mainFrame(
      body: TabBarWidget(
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
  Widget buildWidget(BuildContext context, DataSuccess<List<Task>> state) {
    return CarsScreen(
      isFilter: false,
      tasks: state.data ?? [],
    );
  }

  @override
  String? title(BuildContext context) {
    return context.strings.sort_by;
  }
}

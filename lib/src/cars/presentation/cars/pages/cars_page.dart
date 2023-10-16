import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:delala/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../domain/entities/tasks.dart';
import '../bloc/cars_bloc.dart';
import 'cars_screen.dart';

class CarsPage extends BaseBlocWidget<DataSuccess<List<Task>>, CarsCubit> {
  CarsPage({Key? key}) : super(key: key);

  @override
  void loadInitialData(BuildContext context) {
    bloc.fetchTasks();
  }

  @override
  bool hasTabBarView(BuildContext context) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
    return mainFrame(
      body: buildConsumer(context),
      tabs: [
        TabModel(label: context.strings.all),
        TabModel(label: context.strings.new_),
        TabModel(label: context.strings.used),
      ],
      hasFilter: true,
      // leading: AppCircularIconButton(
      //   icon: AppIcons.add,
      // ),
    );
  }

  // @override
  // bool hasFilter(BuildContext context) {
  //   return true;
  // }

  @override
  List<Widget> tabViews(BuildContext context) {
    return [
      CarsScreen(
        isFilter: gerArguments(context)?.paramsFilter == null,
        tasks: [],
      ),
      CarsScreen(
        isFilter: gerArguments(context)?.paramsFilter == null,
        tasks: [],
      ),
      CarsScreen(
        isFilter: gerArguments(context)?.paramsFilter == null,
        tasks: [],
      ),
    ];
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Task>> state) {
    return CarsScreen(
      isFilter: gerArguments(context)?.paramsFilter == null,
      tasks: state.data ?? [],
    );
  }

  @override
  String? title(BuildContext context) {
    return gerArguments(context)?.categoryName;
  }

  CarsPageArgs? gerArguments(BuildContext context) {
    return ModalRoute.of(context)?.settings.arguments as CarsPageArgs?;
  }
}

class CarsPageArgs {
  final String? paramsFilter;
  final String? categoryName;
  final String? categoryID;

  CarsPageArgs({this.paramsFilter, this.categoryName, this.categoryID});
}

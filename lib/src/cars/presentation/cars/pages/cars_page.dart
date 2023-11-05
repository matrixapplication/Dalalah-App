import 'package:dalalah/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:dalalah/src/main_index.dart';
import '../../../../../core/components/base_widget_bloc.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../../home/presentation/widgets/filter_home.dart';
import '../../../domain/entities/tasks.dart';
import '../bloc/cars_bloc.dart';
import '../widgets/brands_filter.dart';
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

  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    //onBuild(bloc);
    return mainFrame(
      onTabSelected: (index) {
        tabIndex = index;
        bloc.fetchTasks();
      },
      body: Column(
        children: [
          FilterHome(
            routeName: Routes.carsSearchPage,
            onFilterOrder: () {},
          ),
          10.ph,
          BrandsFilter(
            items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
                .map((e) => e.toString())
                .toList(),
            onFilter: (value) {},
          ),
          Expanded(child: buildConsumer(context)),
        ],
      ),
      // body: buildConsumer(context),
      tabs: [
        TabModel(label: context.strings.all),
        TabModel(label: context.strings.new_),
        TabModel(label: context.strings.used),
      ],
      // tabViews: [
      //   CarsScreen(
      //     isFilter: false,
      //     tasks: [],
      //   ),
      //   CarsScreen(
      //     isFilter: false,
      //     tasks:  [],
      //   ),
      //   CarsScreen(
      //     isFilter: false,
      //     tasks:  [],
      //   )
      // ]
    );
  }

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Task>> state) {
    return CarsScreen(
      isFilter: false,
      isNew: tabIndex == 1 || tabIndex == 0 ? true : false,
      tasks: state.data ?? [],
    );
    // return 0.ph;
  }

  @override
  String? title(BuildContext context) {
    return strings.cars;
  }

  @override
  onAddButtonPressed() {
    Navigators.pushNamed(Routes.sellCarPage);
  }


  @override
  bool isAddButton() {
    return true;
  }
}

class CarsPageArgs {
  final String? paramsFilter;
  final String? categoryName;
  final String? categoryID;

  CarsPageArgs({this.paramsFilter, this.categoryName, this.categoryID});
}

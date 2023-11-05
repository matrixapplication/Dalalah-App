
import 'package:dalalah/src/cars/presentation/cars/pages/cars_screen.dart';
import '../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../core/widgets/tabview/tabbar_line_widget.dart';
import '../../../main_index.dart';
import '../../../plates/presentation/plates/pages/plates_page.dart';

class FavoritesAndAdsTabs
    extends BaseStatelessWidget {
  FavoritesAndAdsTabs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: getArguments(context) ? context.strings.my_ads : context.strings.favorites,
      body: TabBarLineWidget(
        tabs: [
          TabItemModel(label: context.strings.cars, page: CarsScreen(tasks: [], isFilter: false,)),
          TabItemModel(label: context.strings.plates, page: PlatesPage(isFilter: false)),
          TabItemModel(label: context.strings.buildings, page: Container(
            color: context.scaffoldBackgroundColor,
            alignment: Alignment.center,
            child: Text(strings.soon),
          ),),
        ],
      ),
    );
  }
}

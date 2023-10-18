import 'package:delala/core/components/base_widget_bloc.dart';
import 'package:delala/src/cars/presentation/cars/pages/cars_page.dart';
import 'package:delala/src/cars/presentation/cars/pages/cars_screen.dart';
import '../../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../../core/widgets/tabview/tabbar_line_widget.dart';
import '../../../main_index.dart';
import '../../../plates/domain/entities/plate.dart';
import '../../../plates/presentation/plates/pages/plates_page.dart';
import '../../../plates/presentation/plates/pages/plates_screen.dart';
import '../bloc/favorites_bloc.dart';
import 'favorites_screen.dart';
import 'views/favourite_buildings_view.dart';
import 'views/favourite_cars_view.dart';
import 'views/favourite_plates_view.dart';

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
          )),
        ],
      ),
    );
  }
}

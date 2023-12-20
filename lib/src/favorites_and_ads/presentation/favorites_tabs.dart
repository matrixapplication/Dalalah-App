
import 'package:dalalah/core/widgets/tabview/tabbar_widget.dart';

import '../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../core/widgets/tabview/tabbar_line_widget.dart';
import '../../main_index.dart';
import 'favorites/pages/favorites_cars_page.dart';
import 'favorites/pages/favorites_plates_page.dart';
import 'my_ads/pages/my_cars_page.dart';
import 'my_ads/pages/my_plates_page.dart';

class FavoritesAndAdsTabs
    extends BaseStatelessWidget {
  FavoritesAndAdsTabs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool isAds = getArguments(context) ?? true;
    return AppScaffold(
      title: isAds ? context.strings.my_ads : context.strings.favorites,
      body: TabBarCustomWidget(
     //   backgroundColor: context.scaffoldBackgroundColor,
        tabs: [
          TabItemModel(label: context.strings.cars, page: isAds ? MyCarsPage() : FavoriteCarsPage()),
          TabItemModel(label: context.strings.plates, page:  isAds ? MyPlatesPage() : FavoritePlatesPage()),
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

import 'package:dalalah/src/showrooms/presentation/showrooms/pages/showrooms_page.dart';

import '../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../core/widgets/tabview/tabbar_line_widget.dart';
import '../../main_index.dart';
import '../../real_estate/presentation/properties_developers/pages/properties_developers_page.dart';
import '../../real_estate/presentation/real_estate/pages/real_estate_page.dart';
import 'branches/pages/branches_page.dart';

class ShowroomsAndBranchesTabs extends BaseStatelessWidget {
  ShowroomsAndBranchesTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAds = getArguments(context) ?? true;
    return AppScaffold(
      // title: isAds ? context.strings.my_ads : context.strings.favorites,
      body: Padding(
        padding: (context.statusBarHeight).paddingTop,
        child: TabBarCustomWidget(
          //   backgroundColor: context.scaffoldBackgroundColor,
          tabs: [
            TabItemModel(
              label: context.strings.show_rooms,
              page: ShowroomsPage(),
            ),
            TabItemModel(label: context.strings.real_estate_developers, page: PropertiesDevelopersPage()),
          ],
        ),
      ),
    );
  }
}

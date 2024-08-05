
import 'package:dalalah/src/installment/domain/entities/roles.dart';

import '../../../core/widgets/scaffold/tab_bar_widget.dart';
import '../../../core/widgets/tabview/tabbar_line_widget.dart';
import '../../main_index.dart';
import '../domain/entites/favorites_and_ads_params.dart';
import 'favorites/pages/favorites_cars_page.dart';
import 'favorites/pages/favorites_plates_page.dart';
import 'my_ads/pages/my_cars_page.dart';
import 'my_ads/pages/my_plates_page.dart';
import 'my_ads/pages/my_real_estates_page.dart';

class FavoritesAndAdsTabs
    extends BaseStatelessWidget {
  FavoritesAndAdsTabs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    FavoritesAndAdsParams? params = getArguments(context);
    bool isAds = params?.isAds ?? false;
    return AppScaffold(
      title: isAds ? context.strings.my_ads : context.strings.favorites,
      body:
        params?.type ==Roles.REALESTATEDEVELOPERS?
        MyRealEstatesPage(isHidePayment: true,):
      TabBarCustomWidget(
     //   backgroundColor: context.scaffoldBackgroundColor,
        tabs: [
          TabItemModel(label: context.strings.cars, page: isAds ? MyCarsPage(isHidePayment: params?.isShowPayment ?? false) : FavoriteCarsPage()),
         // if(isAds && !(params!.isUser))
            TabItemModel(label: context.strings.plates, page:  isAds ? MyPlatesPage(isHidePayment: params?.isShowPayment ?? false) : FavoritePlatesPage()),

        ],
      ),
    );
  }
}

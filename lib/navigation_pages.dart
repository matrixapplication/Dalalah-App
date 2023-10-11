
import 'package:delala/core/utils/helper_methods.dart';
import 'package:delala/src/favorites/presentation/pages/favorites_page.dart';
import 'package:delala/src/notifications/presentation/pages/notifications_page.dart';
import 'package:delala/src/profile/presentation/pages/profile_page.dart';
import 'package:delala/src/sell_car/presentation/pages/sell_car_image_picker_page.dart';
import 'package:delala/src/sell_car/presentation/pages/sell_car_page.dart';
import 'core/widgets/base/bottom_navigator_bar_item.dart';
import 'src/home/presentation/pages/home/home_page.dart';
import 'src/main_index.dart';

class NavigationPages extends BaseStatelessWidget {
  bool isCaptain;

  NavigationPages({Key? key, this.isCaptain = false}) : super(key: key);

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: HelperMethods.isAdmin(),
      initialData: false,
      builder: (context, snapshot) {
        return StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) {
            return Scaffold(
              body: snapshot.hasData ? getPagesBaseRole(snapshot.data as bool)[pageIndex] : Container(),
              bottomNavigationBar: snapshot.connectionState == ConnectionState.waiting ? LoadingView() :
              Container(
                height: 65,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: Decorations.shapeTopShadow(
                  color: context.scaffoldBackgroundColor,
                  colorShadow: context.disabledColor,
                  radius: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomNavigatorBarItem(
                      icon: AppIcons.home,
                      label: strings.home,
                      color: getColor(context, 0),
                      onTap: () {
                        setState(() {
                          pageIndex = 0;
                        });
                      },
                    ),
                    BottomNavigatorBarItem(
                      icon: snapshot.data! ? AppIcons.add_car : AppIcons.heart_solid,
                      label: snapshot.data! ? strings.sell_car : strings.favorites,
                      // icon: AppIcons.heart_solid,
                      // label: strings.favorites,
                      color: getColor(context, 1),
                      onTap: () {
                        setState(() {
                          pageIndex = 1;
                        });
                      },
                    ),
                    BottomNavigatorBarItem(
                      icon: AppIcons.notification,
                      label: strings.notifications,
                      color: getColor(context, 2),
                      onTap: () {
                        setState(() {
                          pageIndex = 2;
                        });
                      },
                    ),
                    BottomNavigatorBarItem(
                      icon: AppIcons.profile,
                      label: strings.profile ,
                      color: getColor(context, 3),
                      onTap: () {
                        setState(() {
                          pageIndex = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }
  getColor(BuildContext context,int index) {
    ThemeData theme = Theme.of(context);
    if (index == pageIndex) {
      return theme.primaryColor;
    } else {
      return theme.disabledColor;
    }
  }

  getPagesBaseRole(bool isAdmin){
    print('isAdmin $isAdmin');
    return [
      const HomePage(),
      isAdmin ? SellCarPage() : FavoritesPage(),
      NotificationsPage(),
      ProfilePage(),
    ];
  }
}

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/src/home/presentation/pages/sections_screen.dart';
import 'package:dalalah/src/profile/presentation/pages/profile_page.dart';
import 'package:dalalah/src/showrooms/presentation/showrooms/pages/showrooms_page.dart';
import 'package:dalalah/src/showrooms/presentation/showrooms_and_branches_tabs.dart';
import 'core/widgets/base/bottom_navigator_bar_item.dart';
import 'src/home/presentation/pages/home_page.dart';
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
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Scaffold(
                body: snapshot.hasData
                    ? getPagesBaseRole(snapshot.data as bool)[pageIndex]
                    : Container(),
                bottomNavigationBar:
                    snapshot.connectionState == ConnectionState.waiting
                        ? LoadingView()
                        : Container(
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
                                // BottomNavigatorBarItem(
                                //   icon: AppIcons.sections,
                                //   label: strings.sections,
                                //   // icon: AppIcons.heart_solid,
                                //   // label: strings.favorites,
                                //   color: getColor(context, 1),
                                //   onTap: () {
                                //     setState(() {
                                //       pageIndex = 1;
                                //     });
                                //   },
                                // ),
                                BottomNavigatorBarItem(
                                  icon: AppIcons.add,
                                  label: strings.add,
                                  color: getColor(context, 1),
                                  onTap: () {
                                    setState(() {
                                      pageIndex = 1;
                                    });
                                  },
                                ),
                                BottomNavigatorBarItem(
                                  icon: AppIcons.privacy_policy,
                                  label: strings.show_rooms,
                                  color: getColor(context, 2),
                                  onTap: () {
                                    setState(() {
                                      pageIndex = 2;
                                    });
                                  },
                                ),
                                BottomNavigatorBarItem(
                                  icon: AppIcons.more,
                                  label: strings.more,
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
        });
  }

  getColor(BuildContext context, int index) {
    ThemeData theme = Theme.of(context);
    if (index == pageIndex) {
      return theme.primaryColor;
    } else {
      return theme.disabledColor;
    }
  }

  getPagesBaseRole(bool isAdmin) {
    print('isAdmin $isAdmin');
    return [
       HomePage(),
    //  isAdmin ? SectionsScreen() : SectionsScreen(),
      SectionsScreen(),
      ShowroomsAndBranchesTabs(),
      ProfilePage(),
    ];
  }
}

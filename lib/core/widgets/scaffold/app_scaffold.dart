import 'package:delala/core/widgets/tabview/tabbar_widget.dart';
import 'package:delala/src/main_index.dart';

import '../buttons/app_circular_icon_button.dart';
import '../tabview/animated_tabs_bar.dart';

class AppScaffold extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Widget body;
  final List<TabModel>? tabs;
  final List<Widget>? tabViews;
  final Widget? floatingActionButton;
  final bool? isDrawer;
  final PreferredSizeWidget? appBar;
  final Color? backgroundAppBar;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? resizeToAvoidBottomInset;
  final bool hasTabBarView;

  const AppScaffold({
    Key? key,
    this.title,
    required this.body,
    this.floatingActionButton,
    this.isDrawer = true,
    this.appBar,
    this.backgroundAppBar,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.actions,
    this.titleStyle,
    this.foregroundColor,
    this.leading,
    this.resizeToAvoidBottomInset,
    this.hasTabBarView = false,
    this.tabs,
    this.tabViews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('resizeToAvoidBottomInset: $resizeToAvoidBottomInset ');
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: tabs == null ? 0 : tabs!.length,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        // this code remove the keyboard overflow.
        // drawer: isDrawer! ? SideMenuPage(isCaptain: true) : null,
        //SafeArea to save content from the phone top par.
        // body: AnimatedTabsBar(
        //   isMainTabBar: true,
        //   backgroundColor: Colors.red,
        //   tabs: tabs!,
        //   children: tabViews ?? [],
        // ),
        body: tabs == null
            ? body
            : TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: tabViews ?? [],
              ),
        // extendBody: true,
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        floatingActionButton: floatingActionButton,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        appBar: (title == null && appBar == null)
            ? null
            : appBar ??
                AppBar(
                  title: Padding(
                    padding: 10.paddingTop,
                    child: Text(
                      title ?? '',
                      style: titleStyle ??
                          theme.appBarTheme.titleTextStyle!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  backgroundColor:
                      backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                  flexibleSpace: Container(
                    // decoration: Decorations.mainShapeDecoration(
                    //   radius: 0,
                    // ),
                    // decoration: Decorations.kDecorationBorderRadius(
                    //   color: context.primaryColor,
                    // borderRadius: const BorderRadiusDirectional.only(
                    //   bottomStart: Radius.circular(8),
                    //   bottomEnd: Radius.circular(8),
                    // ),
                    // ),
                    color: context.primaryColor,
                  ),
                  // leading: Container(
                  //   height: 50,
                  //   width: 50,
                  //   color: Colors.white,
                  // ),
                  foregroundColor:
                      foregroundColor ?? theme.appBarTheme.foregroundColor,
                  actions: actions ??
                      [
                        AppCircularIconButton(
                          margin:
                              31.paddingEnd + 16.paddingTop + 4.paddingBottom,
                          icon: AppIcons.rightArrow,
                          size: 28,
                          padding: 3,
                          circleSize: 38,
                          radius: 12,
                          color: const Color(0xff1E232C),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                  leadingWidth: 83,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:
                        backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                    statusBarBrightness: Brightness.light,
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(hasTabBarView ? 70 : 20),
                    child: !hasTabBarView
                        ? 0.ph
                        : TabBar(
                            // splashBorderRadius: BorderRadius.circular(8),
                            // tabAlignment: TabAlignment.fill,
                            // padding: 15.paddingHoriz,
                            onTap: (index) {
                              // if (onTabSelected != null) onTabSelected!(index);
                            },
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            // isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: context.textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            labelColor: Colors.white,
                            unselectedLabelStyle:
                                context.textTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            unselectedLabelColor: Colors.white,
                            indicatorPadding: 15.paddingHoriz,
                            indicatorColor: Colors.white,
                            indicatorWeight: 3,
                            tabs: tabs!
                                .map(
                                  (tab) => Tab(
                                    child: Text(tab.label),
                                  ),
                                )
                                .toList(),
                          ),
                  ),

                  // child: hasTabBarView
                  //     ? Expanded(
                  //         child: AnimatedTabsBar(
                  //           isMainTabBar: true,
                  //           backgroundColor: Colors.transparent,
                  //           tabs: tabs!,
                  //           children: tabViews ?? [],
                  //         ),
                  //       )
                  //     : 0.ph,
                ),
        // leading: leading != null
        //     ? Padding(
        //         padding: const EdgeInsets.only(right: 5),
        //         child: Row(
        //           children: [
        //             if (isDrawer!)
        //               AppIconButton(
        //                 icon: AppIcons.menu,
        //                 size: 28,
        //                 color: theme.cardColor,
        //                 onPressed: () {
        //                   globalKey.currentState?.openDrawer();
        //                 },
        //               ),
        //             leading!,
        //           ],
        //         ),
        //       )
        //     : isDrawer!
        //         ? AppIconButton(
        //             icon: AppIcons.menu,
        //             padding: const EdgeInsets.only(left: 22, top: 18, bottom:5,),
        //             color: theme.cardColor,
        //             size: 15,
        //             onPressed: () {
        //               globalKey.currentState?.openDrawer();
        //             },
        //           )
        //         : null,
      ),
    );
  }
}

// Container(
// height: 45.5,
// width: double.infinity,
// margin: 10.paddingHoriz,
// decoration: Decorations.kDecorationOnlyRadius(
// radius: 50,
// color: Colors.transparent,
// ),
// ),

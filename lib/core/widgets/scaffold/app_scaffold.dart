import 'package:dalalah/core/widgets/tabview/tabbar_widget.dart';
import 'package:dalalah/src/main_index.dart';

import '../../../src/home/presentation/widgets/filter_home.dart';
import '../buttons/app_circular_icon_button.dart';
import '../tabview/animated_tabs_bar.dart';
import 'back_button_icon.dart';

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
  final bool hasFilter;
  final bool hasAppBar;
  final Function()? onAddButtonPressed;
  final bool isAddButton;
  final Function(int)? onTabSelected;
  final int initialIndex;

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
    this.hasFilter = false,
    this.hasAppBar = true,
    this.onAddButtonPressed,
    this.isAddButton = false,
    this.onTabSelected,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('resizeToAvoidBottomInset: $resizeToAvoidBottomInset ');
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: tabs == null ? 0 : tabs!.length,
      child: Scaffold(
        // resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        body: body,
        // extendBody: true,
        backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
        floatingActionButton: floatingActionButton,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        appBar: (title == null && appBar == null)
            ? null
            : appBar ??
                AppBar(
                  title: Text(
                    title ?? '',
                    style: titleStyle ??
                        theme.appBarTheme.titleTextStyle!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor:
                        backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                    statusBarBrightness: Brightness.light,
                  ),
                  backgroundColor:
                      backgroundAppBar ?? theme.appBarTheme.backgroundColor,
                  leading: Navigator.canPop(context)
                      ? CustomBackButton(
                          isPrimaryColor: backgroundAppBar ==
                              context.scaffoldBackgroundColor,
                        )
                      : null,
                  foregroundColor:
                      foregroundColor ?? theme.appBarTheme.foregroundColor,
                  actions: actions ??
                      [
                        if (isAddButton)
                          AppIconButton(
                            icon: AppIcons.add_circular,
                            padding: 14.paddingAll,
                            onPressed: onAddButtonPressed,
                          ),
                      ],
                  leadingWidth: 60,
                  bottom: tabs == null
                      ? null
                      : PreferredSize(
                          preferredSize:
                              Size.fromHeight(hasTabBarView ? 50 : 20),
                          child: !hasTabBarView
                              ? 0.ph
                              : Builder(
                                builder: (context) {
                                  return TabBar(
                                      // splashBorderRadius: BorderRadius.circular(8),
                                      // tabAlignment: TabAlignment.fill,
                                      // padding: 15.paddingHoriz,
                                      onTap: (index) {
                                        onTabSelected?.call(index);
                                      },
                                      controller: TabController(
                                          length: tabs!.length,
                                          initialIndex: initialIndex, vsync: Scaffold.of(context)),
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                      // isScrollable: true,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      labelStyle:
                                          context.textTheme.labelMedium!.copyWith(
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
                                    );
                                }
                              ),
                        ),
                ),
      ),
    );
  }
}

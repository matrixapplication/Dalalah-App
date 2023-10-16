import '../../../src/main_index.dart';

class AnimatedTabsBar extends StatelessWidget {
  final List<TabModel> tabs;
  final List<Widget> children;
  final bool isMainTabBar;
  final double? topMargin;
  final double? bottomMargin;
  final double? rightMargin;
  final double? leftMargin;
  final Color? selectedLabelColor;
  final Color? backgroundColor;
  final Color? unSelectedLabelColor;
  final Function(int)? onTabSelected;

  const AnimatedTabsBar({
    Key? key,
    required this.children,
    required this.tabs,
    this.onTabSelected,
    this.topMargin,
    this.bottomMargin,
    this.rightMargin,
    this.leftMargin,
    this.selectedLabelColor,
    this.unSelectedLabelColor,
    this.backgroundColor,
    this.isMainTabBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          Container(
            height: isMainTabBar ? 45.5 : 35,
            width: double.infinity,
            padding: EdgeInsets.all(isMainTabBar ? 0 : 3),
            margin: EdgeInsets.only(
              top: topMargin ?? (isMainTabBar ? 0 : 10),
              bottom: bottomMargin ?? (isMainTabBar ? 0 : 10),
              right: rightMargin ?? (isMainTabBar ? 10 : 20),
              left: leftMargin ?? (isMainTabBar ? 10 : 20),
            ),
            decoration: Decorations.kDecorationOnlyRadius(
              radius: 50,
              color: backgroundColor ?? Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: TabBar(
                indicator: isMainTabBar
                    ? null
                    : Decorations.kDecorationOnlyRadius(
                        color: context.primaryColor,
                        radius: 50,
                      ),

                splashBorderRadius: BorderRadius.circular(8),
                onTap: (index) {
                  if (onTabSelected != null) onTabSelected!(index);
                },
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                // isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: context.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMainTabBar ? 18 : null,
                ),
                labelColor: selectedLabelColor ?? Colors.white,
                unselectedLabelStyle: context.textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isMainTabBar ? 18 : null,
                ),
                unselectedLabelColor: unSelectedLabelColor ?? (isMainTabBar ? Colors.white : Color(0xff5E5E5E)),
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: tabs
                    .map(
                      (tab) => Tab(
                        // text: e,
                        // icon: Icon(Icons.home),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Icon(tab.icon),
                        //     10.pw,
                        //
                        //   ],
                        // ),
                        child: Text(tab.label),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: children,
            ),
          )
        ],
      ),
    );
  }
}

class TabModel {
  final String label;

  // final IconData icon;

  TabModel({
    required this.label,
    // required this.icon,
  });
}

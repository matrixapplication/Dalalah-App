import 'package:dalalah/src/main_index.dart';

import '../scaffold/tab_bar_widget.dart';

class TabBarLineWidget extends StatelessWidget {
  final double? labelSize;
  final List<TabItemModel> tabs;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final TextStyle? textStyle;
  final Decoration? indicatorDecoration;

  const TabBarLineWidget({
    Key? key,
    required this.tabs,
    this.labelSize,
    this.indicatorDecoration,
    this.selectedLabelColor,
    this.unSelectedLabelColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: context.primaryColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: TabBar(
            onTap: (index) {
              // if (onTabSelected != null) onTabSelected!(index);
            },
            // isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: context.textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            labelColor: Colors.white,
            unselectedLabelStyle: context.textTheme.labelMedium!.copyWith(
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
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabs.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}

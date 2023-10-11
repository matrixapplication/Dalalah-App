import '../../../src/main_index.dart';

class TabItemModel {
  final String label;

  final Widget page;

  TabItemModel({required this.label, required this.page});

  Tab builder() {
    return TabWidgetItemBuilder(this);
  }
}

class TabWidgetItemBuilder extends Tab {
  TabWidgetItemBuilder(TabItemModel model, {Key? key})
      : super(key: key, text: model.label);
}

class TabBarWidget extends StatelessWidget {
  final List<TabItemModel> tabs;
  final Color? backgroundColor;
  final List<Widget>? tabsText;
  final void Function(int)? onTap;
  final EdgeInsetsGeometry? marginTabs;
  final double? height;
  const TabBarWidget({Key? key, required this.tabs, this.backgroundColor, this.tabsText, this.onTap, this.marginTabs, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: theme.cardColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height ?? 50),
          child: AppBar(
          //  backgroundColor: theme.cardColor,
            leading: const SizedBox(),
            flexibleSpace: Container(
              margin: marginTabs ?? EdgeInsets.zero,
              decoration: Decorations.kDecorationBorderRadius(radius: 50),
              child: TabBar(
          //      controller: _tabController,
                onTap: onTap,
                labelStyle: context.labelLarge.copyWith(fontWeight: FontWeight.bold),
                unselectedLabelStyle: context.displayLarge.copyWith(fontWeight: FontWeight.bold),
                indicator:  Decorations.kDecorationRadius(radius: 50, color: context.primaryColor),
                unselectedLabelColor: context.displayLarge.color,
                labelPadding: 20.paddingHoriz,
                tabs: tabs.map((e) => e.builder()).toList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: tabs.map((e) => e.page).toList(),
        ),
      ),
    );
  }
}

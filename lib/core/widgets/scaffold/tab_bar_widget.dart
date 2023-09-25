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
  final EdgeInsetsGeometry? paddingTabs;
  final double? height;
  const TabBarWidget({Key? key, required this.tabs, this.backgroundColor, this.tabsText, this.onTap, this.paddingTabs, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: theme.cardColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height ?? 55),
          child: AppBar(
            backgroundColor: theme.cardColor,
            leading: const SizedBox(),
            flexibleSpace: Container(
              margin: paddingTabs ?? EdgeInsets.zero,
              decoration: Decorations.shapeDecorationShadow(colorShadow: context.outline, color: context.dividerColor),
              child: TabBar(
          //      controller: _tabController,
                onTap: onTap,
                indicator:  Decorations.kDecorationRadius(radius: 5, color: context.primaryColor),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
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

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

class TabBarScaffoldWidget extends StatelessWidget {
  final List<TabItemModel> tabs;
  final Color? backgroundColor;
  final List<Widget>? tabsText;
  final void Function(int)? onTap;
  final EdgeInsetsGeometry? marginTabs;
  final double? height;
  final bool isLineDecoration;

  const TabBarScaffoldWidget({
    Key? key,
    required this.tabs,
    this.backgroundColor,
    this.tabsText,
    this.onTap,
    this.marginTabs,
    this.height,
    this.isLineDecoration = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: theme.cardColor,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height ?? 50),
          child: AppBar(
             backgroundColor: Colors.white,
            leading: const SizedBox.shrink(),
            flexibleSpace: Container(
              margin: marginTabs ?? EdgeInsets.zero,
              decoration: Decorations.kDecorationBorderWithRadius(radius: 50),
              child: TabBar(
                //      controller: _tabController,
                onTap: onTap,
                labelStyle: context.labelLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: context.displayLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                indicator: Decorations.kDecorationRadius(
                  radius: 50,
                  color: context.primaryColor,
                ),
                splashBorderRadius: BorderRadius.circular(50),
                unselectedLabelColor: context.displayLarge.color,
                labelPadding: 2.paddingTop,
                tabs: tabs.map((e) => SizedBox(
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Tab(
                      text: e.label,
                    ),
                  ),
                )).toList(),
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

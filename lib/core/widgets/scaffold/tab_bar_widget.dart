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
  const TabBarWidget({Key? key, required this.tabs, this.backgroundColor, this.tabsText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: AppBar(
              backgroundColor: theme.cardColor,
              elevation: 0,
              leading: const SizedBox(),
              flexibleSpace: TabBar(
                labelStyle: theme.textTheme.displayMedium!,
                unselectedLabelColor: kGreyColor,
                labelColor: theme.primaryColor,
                indicatorColor: theme.primaryColor,
                labelPadding: const EdgeInsets.symmetric(horizontal: 0),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorPadding: const EdgeInsets.only(top: 20),
                tabs: tabsText?.map((e) => e).toList() ??
                tabs.map((e) => e.builder()).toList(),
              ),
            ),
          ),
          body: TabBarView(
            children: tabs.map((e) => e.page).toList(),
          ),
        ),
      ),
    );
  }
}

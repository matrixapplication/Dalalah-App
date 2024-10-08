import 'package:dalalah/src/main_index.dart';

import '../scaffold/tab_bar_widget.dart';


class TabWidgetItemBuilder extends Tab {
  TabWidgetItemBuilder(TabItemModel model, {Key? key})
      : super(key: key, text: model.label);
}

class TabBarWidget extends StatelessWidget {
  final double? labelSize;
  final List<TabItemModel> tabs;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final TextStyle? textStyle;
  final Decoration? indicatorDecoration;

  const TabBarWidget({
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
        // backgroundColor: kBackgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            margin: 15.paddingHoriz,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.grey[100]!),
              ),
            ),
            child: TabBar(
              // indicatorColor: Colors.white,

              isScrollable: tabs.length > 3,
              unselectedLabelStyle: context.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: labelSize ?? 18,
              ),
              labelStyle: context.textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: labelSize ?? 18,
                // height: 0.5,
              ),
              labelColor: selectedLabelColor ?? context.primaryColor,
              unselectedLabelColor: unSelectedLabelColor ?? AppColors.grey_4B,
              // indicator: const BoxDecoration(
              //   color: kPrimaryDark,
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(21),
              //   ),
              // ),
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              indicatorWeight: 3,
              indicator: indicatorDecoration,
              indicatorColor: context.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: tabs.length > 3 ? TabAlignment.start : TabAlignment.fill,

              tabs: tabs.map((e) => e.builder()).toList(),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: tabs
              .map((e) => Padding(
                    padding: 0.paddingTop,
                    child: e.page,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

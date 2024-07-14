
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../themes/colors.dart';
import '../scaffold/tab_bar_widget.dart';



class CustomTabItemModel  extends StatelessWidget{
  final Function(int)? onTap;
  final List<TabItemModel> tabs ;
  const CustomTabItemModel({super.key ,required this.tabs, this.onTap, this.labelSize, this.selectedLabelColor, this.unSelectedLabelColor, this.textStyle, this.indicatorDecoration});
  final double? labelSize;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final TextStyle? textStyle;
  final Decoration? indicatorDecoration;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child:
        Column(
          children: [
            TabBar(
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
            Expanded(
              child: TabBarView(
                // physics: const NeverScrollableScrollPhysics(),
                children: tabs.map((e) => e.page).toList(),
              ),
            ),
          ],
        ),
    );
  }

}

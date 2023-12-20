import 'package:dalalah/core/widgets/buttons/primary_icon_button.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

class RowTextsIconsButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final EdgeInsetsGeometry? margin;
  final String icon1;
  final String icon2;
  final Color? iconColor1;
  final Color? backgroundColor1;
  final Color? iconColor2;
  final Color? backgroundColor2;
  final double? iconSize1;
  final double? iconSize2;
  final BorderRadiusGeometry? borderRadius1;
  final BorderRadiusGeometry? borderRadius2;
  final Decoration? decoration1;
  final Decoration? decoration2;
  final Widget? centerWidget;
  final TextStyle? titleStyle2;
  const RowTextsIconsButtons({Key? key, this.title1, this.title2, this.onPressed1, this.onPressed2, this.margin, required this.icon1, required this.icon2, this.iconColor1, this.backgroundColor1, this.iconColor2, this.backgroundColor2, this.iconSize1, this.iconSize2, this.borderRadius1, this.borderRadius2, this.decoration1, this.decoration2, this.centerWidget, this.titleStyle2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: PrimaryIconButton(
              title: title1,
              icon: icon1,
              backgroundColor: backgroundColor1 ?? context.primaryColor,
              borderRadius: borderRadius1 ?? const BorderRadiusDirectional.only(bottomStart: Radius.circular(8)),
              radius: 10,
              decoration: decoration1,
              onPressed: onPressed1,
            ),
          ),
          if (centerWidget != null)
            Expanded(
              child: centerWidget!,
            ),
          Expanded(
            child: PrimaryIconButton(
              title: title2,
              icon: icon2,
              iconColor: iconColor2 ,
              titleStyle: titleStyle2 ?? context.headlineMedium.copyWith(),
              backgroundColor: backgroundColor2 ?? context.onSecondaryContainer,
              borderRadius: borderRadius2 ?? const BorderRadiusDirectional.only(bottomEnd: Radius.circular(8)),
              decoration: decoration2,
              radius: 10,
              onPressed: onPressed2,
            ),
          ),
        ],
      ),
    );
  }
}

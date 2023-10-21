import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/utils/navigator.dart';
import 'package:delala/core/widgets/list-tile/custom_list_tile2.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/widgets/buttons/app_circular_icon.dart';

///  Created by harbey on 9/3/2023.
class ProfileItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? icon;
  final IconData? iconData;
  final bool isLast;
  final VoidCallback? onTap;
  final Color? iconBackgroundColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final Color? colorTitle;
  final EdgeInsetsGeometry? contentPadding;
  final bool isLogoutTile;
  final String? routeName;
  final dynamic arguments;

  const ProfileItem({
    Key? key,
    required this.title,
    this.icon,
    this.isLast = false,
    this.onTap,
    this.iconBackgroundColor,
    this.backgroundColor,
    this.iconColor,
    this.iconData,
    this.margin,
    this.decoration,
    this.colorTitle,
    this.contentPadding,
    this.subTitle,
    this.isLogoutTile = false,
    this.routeName,
    this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 30.paddingBottom,
      child: CustomListTile2(
        title: title,
        subtitle: subTitle,
        titleStyle:
            context.titleSmall.copyWith(fontSize: 16, color: colorTitle),
        backgroundColor: backgroundColor,
        margin: margin,
        decoration: decoration,
        contentPadding: contentPadding ?? 16.paddingHoriz,
        leading: AppCircularIcon(
          icon: icon,
          iconData: iconData,
          radius: 23,
          size: 22,
          backgroundColor: iconBackgroundColor ?? context.primaryColor,
          color: iconColor ?? context.cardColor,
        ),
        trailing: isLogoutTile
            ? 0.ph
            : Icon(
                Icons.arrow_forward_ios_rounded,
                color: context.hintColor,
                size: 18,
              ),
        onTap: () {
            if (routeName != null) {
              Navigators.pushNamed(routeName ?? '', arguments: arguments);
            } else {
              onTap!();
            }
        },
      ),
    );
  }
}

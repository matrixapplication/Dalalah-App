import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/widgets/list-tile/custom_list_tile2.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/app_circular_icon.dart';

///  Created by harbey on 9/3/2023.
class ProfileItem extends StatelessWidget {
  final String title;
  final String? icon;
  final IconData? iconData;
  final bool isLast;
  final VoidCallback onTap;
  final Color? iconBackgroundColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;
  final Color? colorTitle;
  final EdgeInsetsGeometry? contentPadding;

  const ProfileItem(
      {Key? key,
      required this.title,
      this.icon,
      this.isLast = false,
      required this.onTap,
      this.iconBackgroundColor,
      this.backgroundColor,
      this.iconColor,
      this.iconData,
      this.margin,
      this.decoration,
      this.colorTitle,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomListTile2(
          title: title,
          titleStyle:
              context.titleSmall.copyWith(fontSize: 16, color: colorTitle),
          backgroundColor: backgroundColor,
          margin: margin,
          decoration: decoration,
          contentPadding: contentPadding ?? 32.paddingHoriz,
          leading: AppCircularIcon(
            icon: icon,
            iconData: iconData,
            backgroundColor: iconBackgroundColor,
            color: iconColor,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: context.outline,
            size: 18,
          ),
          onTap: onTap,
        ),
        if (!isLast)
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 15),
            child: Divider(
              height: 1,
              thickness: 1,
              indent: 70,
              endIndent: 16,
              color: context.dividerColor,
            ),
          ),
      ],
    );
  }
}

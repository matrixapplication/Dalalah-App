import 'package:delala/core/widgets/buttons/app_icon.dart';
import 'package:delala/core/widgets/buttons/app_icon_button.dart';
import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_icons.dart';

///  Created by harbey on 10/11/2023.
class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final EdgeInsetsGeometry? margin;
  final double? iconSize;

  const FavoriteButton({
    Key? key,
    this.margin,
    this.isFavorite = false,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x3F8D8D8D),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: AppIconButton(
        padding: 7.paddingHoriz + 10.paddingTop + 7.paddingBottom,
        size: iconSize ?? 20,
        icon: isFavorite ? AppIcons.heart_solid : AppIcons.heart,
        color: context.primaryColor,
        onPressed: () {},
      ),
    );
  }
}

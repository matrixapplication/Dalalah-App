import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../assets/app_icons.dart';
import '../../decorations/decorations.dart';
import 'app_icon.dart';

class PrimaryIconButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final Function()? onPressed;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String? icon;
  final Color? iconColor;
  final IconData? iconData;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? width;

  const PrimaryIconButton({
    Key? key,
    this.title,
    this.onPressed,
    this.height,
    this.backgroundColor,
    this.borderRadius,
    required this.icon,
    this.iconColor,
    this.titleStyle,
    this.decoration,
    this.padding,
    this.radius,
    this.width,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      width: width,
      height: height,
      decoration: decoration ??
          Decorations.shapeDecorationShadow(
            color: backgroundColor ?? theme.primaryColor,
            colorShadow: Colors.white,
            radius: radius,
            borderRadius: borderRadius,
          ),
      child: InkWell(
        onTap: onPressed,
        radius: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null
                ? Icon(
                    iconData,
                    color: iconColor,
                  )
                : AppIcon(icon: icon!, color: iconColor, size: 20),
            const SizedBox(width: 10),
            Text(
              title!,
              style: titleStyle ?? theme.textTheme.labelMedium,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

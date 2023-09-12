import 'package:arabitac/src/main_index.dart';
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
  final String icon;
  final Color? iconColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  const PrimaryIconButton(
      {Key? key,
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
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: decoration ??  Decorations.shapeDecorationShadow(
        color: backgroundColor ?? theme.primaryColor,
        colorShadow: context.disabledColor,
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
            AppIcon(icon: icon, color: iconColor ?? theme.primaryColor, size: 22),
            const SizedBox(width: 10),
            Text(title!,
              style: titleStyle ?? theme.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            )

          ],
        ),
      ),
    );
  }
}

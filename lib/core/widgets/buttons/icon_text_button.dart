import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import 'app_icon.dart';

///  Created by harbey on 7/16/2023.
class IconTextButton extends StatelessWidget {
  final String? text;

  final Function()? onTap;

  final Widget? child;
  final Color? textColor;

  final TextStyle? textStyle;
  final double? fontSize;
  final String icon;
  final double? iconSize;
  final Color? iconColor;
  final MainAxisAlignment? mainAxisAlignment;
  final Widget? customIcon;
  final bool? isFlexible;
  final EdgeInsetsGeometry? padding;
  final bool? isFirstIcon;
  final double? space;

  const IconTextButton(
      {Key? key,
      this.text,
      this.onTap,
      this.child,
      this.fontSize,
      this.textColor,
      this.textStyle,
      required this.icon,
      this.iconSize,
      this.iconColor,
      this.mainAxisAlignment,
      this.customIcon,
      this.isFlexible = false,
      this.padding,
      this.isFirstIcon = true,
      this.space = 8,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           if(isFirstIcon!)
           ...[ customIcon ?? _buildIcon(),
             (space ?? 8).pw,
            isFlexible!
                ? Flexible(
                    fit: FlexFit.loose,
                    child: _buildText(context),
                  )
                : _buildText(context),]
            else
            ...[isFlexible!
                ? Flexible(
                    fit: FlexFit.loose,
                    child: _buildText(context),
                  )
                : _buildText(context),
              (space ?? 8).pw,
                customIcon ?? _buildIcon(),]
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Text(
      text!,
      style: textStyle ??
          context.titleMedium.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildIcon() {
    return AppIcon(
      icon: icon,
      padding: 5.paddingTop,
      size: iconSize,
      color: iconColor,
    );
  }
}

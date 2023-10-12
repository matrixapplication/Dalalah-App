import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../images/image_network.dart';

class IconText extends StatelessWidget {
  final String text;
  final String? icon;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final bool? isExpanded;
  final double? sizedBoxWidth;
  final bool? isIconLift;
  final bool isImage;
  final IconData? iconData;
  final bool isIconData;

  const IconText({
    Key? key,
    required this.text,
    this.icon,
    this.textStyle,
    this.iconSize,
    this.iconColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.mainAxisAlignment,
    this.isExpanded,
    this.crossAxisAlignment,
    this.sizedBoxWidth,
    this.isIconLift = false,
    this.isImage = false,
    this.iconData,
    this.isIconData = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsetsDirectional.zero,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        children: [
          isIconLift ?? false
              ? isExpanded ?? false
                  ? buildExpandedText(context)
                  : buildText(context)
              : buildIconOrImage(context),
          SizedBox(
            width: sizedBoxWidth ?? 8,
          ),
          isIconLift ?? false
              ? buildIconOrImage(context)
              : isExpanded ?? false
                  ? buildExpandedText(context)
                  : buildText(context),
        ],
      ),
    );
  }

  Widget buildText(BuildContext context) => Text(text,
      style: textStyle ??
          context.headlineLarge.copyWith(
            color: textColor ?? AppColors.blue_4d,
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.w500,
          ));

  Widget buildExpandedText(BuildContext context) => Expanded(
        child: Text(
          text,
          style: textStyle ??
              context.headlineLarge.copyWith(
                color: textColor,
                fontSize: fontSize ?? 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      );

  Widget buildIconOrImage(BuildContext context) => icon?.split('/').last.contains('.png') ?? false
      ? Image.asset(icon ?? '', height: iconSize, width: iconSize)
      : isIconData
          ? Icon(iconData, size: iconSize ?? 20, color: iconColor)
          : AppIcon(
              icon: icon ?? '',
              size: iconSize ?? 15,
              color: iconColor,
            );
}

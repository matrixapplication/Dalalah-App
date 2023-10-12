import 'package:delala/core/assets/app_icons.dart';
import 'package:delala/core/widgets/buttons/app_circular_icon.dart';
import 'package:delala/core/widgets/buttons/icon_text_button.dart';
import 'package:delala/core/widgets/buttons/row_texts_icons_buttons.dart';
import 'package:delala/core/widgets/icons/icon_text.dart';
import 'package:delala/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../utils/helper_methods.dart';

///  Created by harbey on 9/6/2023.
class ContactSocialButtons extends StatelessWidget {
  final String phone;

  const ContactSocialButtons({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Decorations.shapeTopShadow(
        colorShadow: context.outline.withOpacity(0.1),
        color: context.cardColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: ContactButton(
              label: context.strings.call,
              icon: AppIcons.phone,
              iconSize: 20,
            ),
          ),
          Expanded(
            child: ContactButton(
              label: context.strings.whatsapp,
              icon: AppIcons.whatsapp,
              iconSize: 20,
              backgroundColor: context.cardColor,
              iconBackgroundColor: context.primaryColor,
              labelColor: context.gray_87,
              isRadius: false,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final String label;
  final String icon;
  final double? iconSize;
  final Color? labelColor;
  final Color? backgroundColor;
  final Color? iconBackgroundColor;
  final bool? isRadius;

  const ContactButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconSize,
    this.backgroundColor,
    this.iconBackgroundColor,
    this.labelColor,
    this.isRadius = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 20.paddingHoriz + 12.paddingVert,
      decoration: Decorations.kDecorationTopEndRadius(
        color: backgroundColor ?? context.primaryColor,
        radius: isRadius! ? 15 : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: context.bodyLarge
                .copyWith(color: labelColor ?? context.cardColor),
          ),
          20.pw,
          AppCircularIcon(
            icon: icon,
            backgroundColor: iconBackgroundColor ?? context.cardColor,
            size: iconSize,
            radius: 18,
          ),
        ],
      ),
    );
  }
}

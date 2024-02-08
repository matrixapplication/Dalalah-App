import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/core/widgets/buttons/app_circular_icon.dart';
import 'package:dalalah/core/widgets/buttons/icon_text_button.dart';
import 'package:dalalah/core/widgets/buttons/row_texts_icons_buttons.dart';
import 'package:dalalah/core/widgets/icons/icon_text.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../utils/helper_methods.dart';

///  Created by harby on 9/6/2023.
class ContactSocialButtons extends StatelessWidget {
  final String phone;
  final String? whatsapp;

  const ContactSocialButtons({Key? key, required this.phone, this.whatsapp}) : super(key: key);

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
              icon: AppIcons.phone_solid,
              iconColor: context.primaryColor,
              iconSize: 20,
              onTap: () => HelperMethods.launchCallPhone(phone),
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
              onTap: () => HelperMethods.launchWhatsApp(whatsapp ?? ''),
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
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? iconBackgroundColor;
  final bool? isRadius;
  final void Function()? onTap;

  const ContactButton({
    Key? key,
    required this.label,
    required this.icon,
    this.iconSize,
    this.iconColor,
    this.backgroundColor,
    this.iconBackgroundColor,
    this.labelColor,
    this.isRadius = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
            AppCircularIcon(
              icon: icon,
              backgroundColor: iconBackgroundColor ?? context.cardColor,
              size: iconSize,
              color: iconColor,
              radius: 18,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:arabitac/core/assets/app_icons.dart';
import 'package:arabitac/core/widgets/buttons/row_texts_icons_buttons.dart';
import 'package:arabitac/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../utils/helper_methods.dart';

///  Created by harbey on 9/6/2023.
class ContactSocialButtons extends StatelessWidget {
  final String phone;

  const ContactSocialButtons({Key? key, required this.phone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RowTextsIconsButtons(
      icon1: AppIcons.phone_solid,
      icon2: AppIcons.whatsapp,
      title1: context.strings.call_dealer,
      title2: context.strings.whatsapp,
      backgroundColor2: context.primaryColor,
   //     margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      onPressed1: () {
        HelperMethods.launchCallPhone(phone);
      },
      onPressed2: () {
        HelperMethods.launchWhatsApp(phone);
      },
    );
  }
}

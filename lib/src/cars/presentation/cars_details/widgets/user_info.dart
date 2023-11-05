import 'package:dalalah/core/widgets/buttons/call_button.dart';
import 'package:dalalah/core/widgets/buttons/chat_whats_app_button.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/icons/icon_text.dart';

///  Created by harbey on 10/24/2023.
class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
      alignment: Alignment.center,
      padding: 5.paddingVert + 10.paddingHoriz,
      margin: 20.paddingTop,
      decoration: Decorations.kDecorationBorderWithRadius(
          color: context.scaffoldBackgroundColor,
          borderColor: context.gray_5c,
          radius: 50
      ),
      child: Row(
        children: [
          IconText(
            mainAxisAlignment: MainAxisAlignment.start,
            text: 'Mohamed Ali',
            icon: AppImages.car_name,
            iconSize: 50,
          ),
          Spacer(),
          ChatWhatsAppButton(phone: '', decoration: Decorations.kDecorationBorder(radius: 50)),
          5.ph,
          CallButton(phone: '', decoration: Decorations.kDecorationBorder(radius: 50)),

        ],
      ),
    );
  }
}

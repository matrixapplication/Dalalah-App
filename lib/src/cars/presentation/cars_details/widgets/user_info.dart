import 'package:dalalah/core/widgets/buttons/call_button.dart';
import 'package:dalalah/core/widgets/buttons/chat_whats_app_button.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/icons/icon_text.dart';
import '../../../data/models/model_object.dart';
import '../../../domain/entities/car_details.dart';

///  Created by harby on 10/24/2023.
class UserInfo extends StatelessWidget {
  final ModelObject user;
  UserInfo({Key? key, required this.user}) : super(key: key);
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
            text: user.name ?? '',
            icon: user.image ?? '',
            iconSize: 50,
          ),
          Spacer(),
          ChatWhatsAppButton(phone: user.whatsapp ?? '', decoration: Decorations.kDecorationBorder(radius: 50)),
          5.ph,
          CallButton(phone: user.phone ?? '', decoration: Decorations.kDecorationBorder(radius: 50)),

        ],
      ),
    );
  }
}

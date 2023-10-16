import 'package:delala/core/assets/app_icons.dart';
import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/utils/navigator.dart';
import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:delala/core/widgets/images/logo.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/buttons/app_icon.dart';
import 'change_language_popup.dart';

///  Created by harbey on 10/12/2023.
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        15.pw,
        AppCircularIconButton(
          icon: AppIcons.notification,
          backgroundColor: context.cardColor,
          color: context.primaryColor,
          padding: 9,
          size: 28,
          circleSize: 40,
          onPressed: () {
            Navigators.pushNamed(Routes.notificationsPage);
          },
        ),
        10.pw,
        // ChangeLanguagePopup(),
        const Spacer(),
        const Logo(size: 65),
        // 5.pw,
      ],
    );
  }
}

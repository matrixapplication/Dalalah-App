import 'package:dalalah/core/assets/app_icons.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:dalalah/core/widgets/images/logo.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/buttons/app_icon.dart';
import 'change_language_popup.dart';

///  Created by harby on 10/12/2023.
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Logo(size: 65),
        ChangeLanguagePopup(),
        const Spacer(),
        FutureBuilder(
          initialData: false,
          future: HelperMethods.isAuth(),
          builder: (context, snapshot) {
            return snapshot.data == true
                ? AppCircularIconButton(
                    icon: AppIcons.notification,
                    backgroundColor: context.cardColor,
                    color: context.primaryColor,
                    padding: 9,
                    size: 28,
                    circleSize: 40,
                    onPressed: () {
                      pushNamed(Routes.notificationsPage);
                    },
                  )
                : 0.ph;
          },
        ),
        15.pw,
      ],
    );
  }
}

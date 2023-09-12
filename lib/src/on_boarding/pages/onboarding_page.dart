import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:arabitac/core/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/navigator.dart';
import '../../../core/widgets/scaffold/app_scaffold.dart';
import 'onboarding_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen();
    //   AppScaffold(
    //     backgroundAppBar: context.primaryColor,
    //   actions: [TextButton(
    //     child: Text('Skip'),
    //     onPressed: () {
    //       Navigators.pushReplacementNamed(Routes.login);
    //     },
    //   )],
    //   backgroundColor: context.primaryColor,
    //   body: OnBoardingScreen(),
    // );
  }
}

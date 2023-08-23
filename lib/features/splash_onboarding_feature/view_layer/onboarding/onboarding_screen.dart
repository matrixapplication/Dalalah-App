import 'package:arabitac/features/splash_onboarding_feature/view_layer/onboarding/onboarding_body/onboarding_body.dart';
import 'package:flutter/material.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingBody(),
      ),
    );
  }
}

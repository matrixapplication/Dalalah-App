import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/images/logo.dart';
import 'package:flutter/material.dart';

import '../../assets/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      color: context.primaryColor,
      child: Image.asset(
        AppImages.splash,
        width: 100,
        height: 100,
      ),
    );
  }
}

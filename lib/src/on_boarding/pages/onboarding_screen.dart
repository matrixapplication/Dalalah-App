import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../core/routes/routes.dart';
import '../../../core/utils/navigator.dart';
import '../widgets/background_images.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: context.primaryColorDark,
      finishButtonText: 'Get Started',
      hasFloatingButton: true,
      addButton: true,
      finishButtonTextStyle: context.labelLarge.copyWith(fontSize: 25),
      finishButtonStyle: finishButtonStyle(context),
      indicatorPosition: 100,
      indicatorAbove: true,
      skipTextButton: skipTextButton(context),
      skipIcon: skipIcon(context),
      trailing: skipTextButton(context),
      onFinish: (){
        onFinish();
      },
      controllerColor: Colors.white,
      addController: true,
      pageBackgroundGradient: RadialGradient(colors: [context.primaryColor, context.primaryColorDark]),
      totalPage: 3,
      speed: 1.8,
      pageBodies: BackgroundImages.pages,
      centerBackground: true,
      imageVerticalOffset: 260.h,
      background: BackgroundImages.backgroundImages,
    );
  }

  onFinish(){
    final assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio("assets/mp3/Supra Sound - Notification.mp3"),
    );
    Navigators.pushNamedAndRemoveUntil(Routes.login);
    // Navigator.
  }


  Widget skipTextButton(BuildContext context){
    return Text(
      context.strings.skip,
      style: context.labelMedium,
    );
  }

  Icon skipIcon(BuildContext context){
    return const Icon(
      Icons.arrow_forward_rounded,
      color: Colors.white,
      weight: 20,
    );
  }
  finishButtonStyle(BuildContext context){
    return FinishButtonStyle(
        backgroundColor: context.colorScheme.surface,
        foregroundColor: Colors.white,
        splashColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(500))));
  }
}

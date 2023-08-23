import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/core/routing/navigation_services.dart';
import 'package:arabitac/core/routing/routes.dart';
import 'package:arabitac/features/splash_onboarding_feature/view_layer/onboarding/components/slide1.dart';
import 'package:arabitac/features/splash_onboarding_feature/view_layer/onboarding/components/slide2.dart';
import 'package:arabitac/features/splash_onboarding_feature/view_layer/onboarding/components/slide3.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';


class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: primaryColorDark,

      finishButtonText: 'Get Started',
      hasFloatingButton: true,
      addButton: true,
      finishButtonTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Colors.white
      ),
      imageVerticalOffset: 350.h,

      finishButtonStyle:  const FinishButtonStyle(
        backgroundColor: primaryOrangeColor,
        foregroundColor: Colors.white,
        splashColor: Colors.white,
        shape:   RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(150.0)))
      ),
      skipTextButton:  const CustomText("Next" , color: Colors.white),

      skipIcon: const Icon(Icons.arrow_forward_ios , color: Colors.white, weight: 20,),
      trailing: const CustomText( "Skip" ,color: Colors.white,),
      trailingFunction: (){
        // NavigationService.pushReplacement(context , Routes.loginScreen);
      },
      onFinish: (){
        final assetsAudioPlayer = AssetsAudioPlayer();
        assetsAudioPlayer.open(
          Audio("assets/mp3/Supra Sound - Notification.mp3"),
        );
        NavigationService.pushReplacement(Routes.login);
      },
      centerBackground: true,
      controllerColor: Colors.white,
      addController: true,

      pageBackgroundGradient: const RadialGradient(colors: [primaryColor, primaryColorDark]),
      totalPage: 3,
      speed: 1.8,
      pageBodies: const [
        Slide1(),
        Slide2(),
        Slide3(),
      ], background:  [
        CustomAssetsImage(image: AssetsManager.carOne ,width: 200.w,),
        CustomAssetsImage(image: AssetsManager.carTwo),
        Container(
          margin: EdgeInsets.only(bottom: 200.h),
          padding: EdgeInsets.only(bottom: 200.h),
          child: CustomAssetsImage(image: AssetsManager.noImage),
        ),
    ],
    );
  }
}





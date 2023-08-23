import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          CustomAssetsImage(image: AssetsManager.splashBg  , boxFit: BoxFit.cover,width: double.infinity,) ,
          Align(
            alignment: Alignment.center,
            child: CustomAssetsImage(image: AssetsManager.appLogo , width: 240,height: 310,),
          )
        ],
      ),
    );
  }
}
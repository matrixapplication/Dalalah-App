import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:flutter/material.dart';


class AuthBg extends StatelessWidget {
  const AuthBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: double.infinity,
      decoration:  BoxDecoration(
          color: primaryColor ,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r) ,
            bottomRight: Radius.circular(20.r)
          )
      ),
      child: Column(
        children: [
          VerticalSpace(0.h),
          CustomAssetsImage(image: AssetsManager.appLogo , width: 280.w,)
        ],
      ),
    );
  }
}

import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:flutter/material.dart';


class Slide3 extends StatelessWidget {
  const Slide3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomAssetsImage(image: AssetsManager.carThree),
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 510.h,
                width: double.infinity,
              ),
              SizedBox(
                width: 400.w,
                child: CustomText(
                  "Continue as Guest",
                  color: Colors.white,
                  size: 20.h,
                  bold: true,
                ).header(),
              ),
              VerticalSpace(10.h),
              SizedBox(
                width: 300.w,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      "Already have an account ?",
                      align: TextAlign.start,
                      color: Colors.white,
                      size: 16.h,
                    ).footer().start() ,
                    CustomText(
                      "login",
                      align: TextAlign.start,
                      color: primaryOrangeColor,
                      size: 16.h,
                    ).footer().start() ,


                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:flutter/material.dart';

class Slide1 extends StatelessWidget {
  const Slide1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.h,
            width: double.infinity,
          ),
          SizedBox(
            width: 400.w,
            child: CustomText(
              "Lorem paas",
              color: primaryOrangeColor,
              size: 22.h,
              bold: true,
            ).header().start(),
          ),
          VerticalSpace(10.h),
          SizedBox(
            width: 300.w,
            child:  CustomText(
              "Ut wisi enim ad minim veniam, quis nostrud nisl ut aliquip ex ea commodo consequat.",
              align: TextAlign.start,
              color: Colors.white,
              size: 18.h,
            ).footer().start(),
          ),
        ],
      ),
    );
  }
}


import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/cutom_shimmer_image.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/material.dart';
class HoriCard extends StatelessWidget {
  const HoriCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.01),
                spreadRadius: 10,
                offset: const Offset(0, 3))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r),
              bottomLeft: Radius.circular(15.r),
            ),
            child: CustomShimmerImage(
              image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOrUxWoOcFvZpXT3_3Ur1RSKF6HJJ_S13FCCgB6FDdmA&s",
              width: 150.w,
              height: 120.h,
              boxFit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  "BMW X6 661i 2023",
                  bold: true,
                ),
                VerticalSpace(10.h),
                Row(
                  children: [
                    HorizontalSpace(10.w),
                    Container(
                      padding: EdgeInsets.all(2.h),
                      decoration: BoxDecoration(
                        color: grayScaleColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: CustomText(
                          "2023",
                          size: 11.h,
                        ),
                      ),
                    ),
                    HorizontalSpace(10.w),
                    Container(
                      padding: EdgeInsets.all(2.h),
                      decoration: BoxDecoration(
                        color: grayScaleColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: CustomText(
                          "1400000 Km",
                          size: 11.h,
                        ),
                      ),
                    ),
                  ],
                ),
                VerticalSpace(10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HorizontalSpace(10.w),
                    Container(
                      padding: EdgeInsets.all(2.h),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: CustomText(
                          "1980000 EGP",
                          color: Colors.white,
                          size: 11.h,
                        ),
                      ),
                    ),
                    HorizontalSpace(10.w),
                    Container(
                      padding: EdgeInsets.all(2.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Theme.of(context)
                                    .shadowColor
                                    .withOpacity(0.02),
                                offset: const Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 10)
                          ]),
                      child: Center(
                        child: Icon(
                          Icons.favorite_border_rounded,
                          color: primaryOrangeColor,
                          size: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
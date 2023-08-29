import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/features/car_list_feature/components/hori_card.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';

import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/material.dart';
class CarListBody extends StatelessWidget {
  const CarListBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(8.h),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TapEffect(
                    onClick: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSvgImage(image: AssetsManager.filter),
                        const CustomText("Filter"),
                      ],
                    )),
              ),
              Container(
                height: 10.h,
                width: 2.w,
                color: primaryColorDark,
              ),
              Expanded(
                child: TapEffect(
                    onClick: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomSvgImage(image: AssetsManager.sort),
                        HorizontalSpace(2.w),
                        const CustomText("Sort by"),
                      ],
                    )),
              ),
            ],
          ),
        ),
        const Divider(
          color: grayScaleE4E4E4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                        Theme.of(context).shadowColor.withOpacity(0.1),
                        offset: const Offset(0, 0),
                        spreadRadius: 1,
                      )
                    ]),
                child: const Center(
                  child: CustomText("All"),
                ),
              ),
              HorizontalSpace(10.w),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                height: 40.h,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.all(8.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .shadowColor
                                  .withOpacity(0.1),
                              offset: const Offset(0, 0),
                              spreadRadius: 1,
                            )
                          ]),
                      child: Center(
                        child: CustomSvgImage(
                            image: AssetsManager.carLogo, height: 26.h),
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.h),
            child: Column(
              children: List.generate(10, (index) => const HoriCard()),
            ),
          ),
        )
      ],
    );
  }
}
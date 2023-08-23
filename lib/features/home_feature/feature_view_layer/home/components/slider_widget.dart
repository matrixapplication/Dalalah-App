
import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/cutom_shimmer_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/resources/resources.dart';


class BuildSliderComponent extends StatefulWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  const BuildSliderComponent({
    required this.drawerKey,
    Key? key,
  }) : super(key: key);

  @override
  State<BuildSliderComponent> createState() => _BuildSliderComponentState();
}

class _BuildSliderComponentState extends State<BuildSliderComponent> {
  int sliderIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          width: double.infinity,

          decoration: BoxDecoration(
              color:primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15.r) , 
              bottomLeft: Radius.circular(15.r)
            )
          ),
          child: CarouselSlider.builder(
            itemCount: 1,
            options: CarouselOptions(
                height: deviceHeight * 0.45,
                //  aspectRatio: 2 / 1,
                viewportFraction: 1,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlay: true,
                reverse: true,
                autoPlayInterval: const Duration(seconds: 5),
                pageSnapping: false,
                //  enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (index, reason) {
                  setState(() {
                    sliderIndex = index;
                    print(index);
                  });
                }),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return
                Stack(
                  children: [
                    CustomAssetsImage(
                      image: AssetsManager.carTwo,
                      boxFit:  BoxFit.cover,
                      height: deviceHeight * 0.30,
                      width: double.infinity,) ,




                  ],
                );


            },
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 5.w),
            child: CustomText(
               "Sell you car now",
                color: Colors.white,
              size: 22.h,
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: 1,
              axisDirection: Axis.horizontal,
              effect: JumpingDotEffect(
                dotColor: Colors.white,
                activeDotColor: primaryOrangeColor,
                dotHeight: 5.h,
                dotWidth: 5.h,
                spacing: 12.w,
              ),
            ),
          ),
        ),

      ],
    );

  }
}

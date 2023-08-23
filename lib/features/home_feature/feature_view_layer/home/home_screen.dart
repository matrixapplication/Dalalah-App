import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/home_slider.dart';
import 'package:arabitac/widgets/custom_button.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/will_scoped.dart';
import 'package:flutter/material.dart';

import 'components/home_title.dart';
import 'components/last_new_car.dart';
import 'components/last_used_car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillScopedScreen(
      onTap: (bool? value) {},
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                homeSlider(sKey: _key),
                VerticalSpace(10.h),
                const HomeTitle(
                  title: "Popular brands",
                ),
                VerticalSpace(5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    height: 170.h,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4 ,childAspectRatio:  1  , crossAxisSpacing: 10.h , mainAxisSpacing: 10.h),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Container(
                          height: 90.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                            color: Colors.white ,
                            border: Border.all(
                              color: grayScaleE4E4E4
                            ) , 
                            borderRadius: BorderRadius.circular(8.r)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgImage(image: AssetsManager.carLogo) , 
                              VerticalSpace(2.h) ,
                              const CustomText("Marcides" , color: Colors.black,)
                            ],
                          ),
                        );
                      },
                      itemCount: 8,
                    ),
                  ),
                ),
                VerticalSpace(5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      buttonText: "See All",
                      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: primaryOrangeColor
                      ),
                      textColor: primaryOrangeColor,
                      width: 160.w,
                      height: 26.h,
                      backgroundColor: Colors.white,
                    )
                  ],
                ) ,
                const HomeTitle(
                  title: "Last new cars",
                ),
                VerticalSpace(5.h),
                const LastNewCar(),
                const HomeTitle(
                  title: "Last used car",
                ),
                const LastUsedCar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}











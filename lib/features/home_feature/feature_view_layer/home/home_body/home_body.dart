import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/core/routing/navigation_services.dart';
import 'package:arabitac/core/routing/routes.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/home_slider.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/home_title.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/last_new_car.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/last_used_car.dart';
import 'package:arabitac/widgets/custom_assets_image.dart';
import 'package:arabitac/widgets/custom_button.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:arabitac/widgets/will_scoped.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required GlobalKey<ScaffoldState> nKey,
  }) : _key = nKey;

  final GlobalKey<ScaffoldState> _key;

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
                 HomeTitle(
                  title: "Popular brands",
                  isAll: false,
                  onTap: (){},
                ),
                VerticalSpace(5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: SizedBox(
                    height: 170.h,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1,
                          crossAxisSpacing: 10.h,
                          mainAxisSpacing: 10.h),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Container(
                          height: 90.h,
                          width: 90.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: grayScaleE4E4E4),
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomSvgImage(image: AssetsManager.carLogo),
                              VerticalSpace(2.h),
                              const CustomText(
                                "Marcides",
                                color: Colors.black,
                              )
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
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: primaryOrangeColor),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            constraints: BoxConstraints(
                              minWidth: 300.w ,
                              minHeight: 500.h ,

                            ),
                            builder: (_) {
                              return Container(
                                height: 570.h,
                                padding: EdgeInsets.all(32.h),
                                child:  Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText("All Brands" ,size: 22.h, color: primaryColor, bold: true,) ,
                                        TapEffect(
                                          onClick: (){
                                            NavigationService.goBack() ;
                                          },
                                          child: const  Icon(Icons.close , color: primaryColor,),
                                        )
                                      ],
                                    ) ,
                                    SizedBox(
                                      height: 460.h,
                                      child:SingleChildScrollView(
                                        child: Column(
                                          children: List.generate(16, (index) => Container(
                                            margin: EdgeInsets.only(bottom: 10.h),
                                            padding: EdgeInsets.all(8.h),
                                            decoration: BoxDecoration(
                                              color: Colors.white ,
                                              borderRadius: BorderRadius.circular(15.r) ,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Theme.of(context).shadowColor.withOpacity(0.1) ,
                                                  spreadRadius: 1 ,
                                                  offset: const Offset(0, 0) ,
                                                )
                                              ] ,

                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomSvgImage(image: AssetsManager.carLogo  , height: 40.h,) ,
                                                    CustomText("Marcides" , size: 18.h,color: primaryColor,)
                                                  ],
                                                ) ,
                                                CustomText("22") ,
                                              ],
                                            ),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }  ,
                          isScrollControlled: true  ,
                          isDismissible: true
                        );
                      },
                      textColor: primaryOrangeColor,
                      width: 160.w,
                      height: 26.h,
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
                 HomeTitle(
                  title: "Last new cars",
                  isAll: true,
                   onTap: (){
                    NavigationService.push(Routes.carList  , arguments: {"title" : "Last new cars"}) ;
                   },
                ),
                VerticalSpace(5.h),
                const LastNewCar(),
                 HomeTitle(
                  title: "Last used car",
                  isAll: true,
                   onTap: (){
                     NavigationService.push(Routes.carList  , arguments: {"title" : "Last used cars"}) ;
                   },
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

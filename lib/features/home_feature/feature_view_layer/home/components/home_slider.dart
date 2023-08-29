import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/assets_menager.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/core/routing/navigation_services.dart';
import 'package:arabitac/core/routing/routes.dart';
import 'package:arabitac/features/home_feature/feature_view_layer/home/components/home_slider_component.dart';
import 'package:arabitac/widgets/custom_svg_image.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/search_text_field.dart';
import 'package:arabitac/widgets/spaces.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class homeSlider extends StatelessWidget {
  homeSlider({
    super.key,
    required GlobalKey<ScaffoldState> sKey,
  }) : _key = sKey;

  final GlobalKey<ScaffoldState> _key;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeSliderComponent(drawerKey: _key),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Row(children: [
            TapEffect(
                onClick: () {
                  _key.currentState!.openDrawer();
                },
                child: Center(
                  child: Icon(
                    Icons.sort,
                    size: 30.h,
                    color: Colors.white,
                  ),
                )),
            const HorizontalSpace(20),
            SearchBarRes(

            )

            //Search
            // SearchBarRes(
            //
            // )
            // Expanded(
            //   child: CustomTextField(
            //     height: 50.h,
            //     controller: searchController,
            //     prefixIcon: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 10.w),
            //       child: Icon(
            //         Icons.search,
            //         size: 30.h,
            //         color: ColorManager.lightBlack,
            //       ),
            //     ),
            //     borderRadius: RadiusManager.s50.r,
            //     hintText: "Search",
            //     textInputType: TextInputType.text,
            //     maxLine: 1,
            //     contentVerticalPadding: 4,
            //
            //
            //
            //   ),
            // ),
          ]),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 230.h),
            child: Container(
              width: 290.w,
              padding: EdgeInsets.all(4.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 0))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TapEffect(
                        onClick: () {
                          NavigationService.push(Routes.filterPage) ;
                        },
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
                        onClick: () {
                          NavigationService.push(Routes.carList) ;
                        },
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
          ),
        )
      ],
    );
  }
}
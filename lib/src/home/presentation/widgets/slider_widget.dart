import 'package:card_swiper/card_swiper.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sliderIndex = 0;
    return Container(
      width: double.infinity,
      margin: 16.paddingHoriz,
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: Decorations.shapeDecorationShadow(
        color: context.gray_F6,
        colorShadow: context.hintColor,
        radius: 10,
      ),
      child: Swiper(
        itemCount: 5,
        index: 5 - 1,
        itemBuilder: (BuildContext context, int index) {
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImages.slider_car,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: 10.paddingStart,
                child: Text(
                  'احصل على احدث\nالسيارات الان مع دلالة',
                  style: context.bodyMedium,),
              )
            ],
          );
        },
        curve: Curves.bounceOut,
        pagination: SwiperCustomPagination(
          builder: (BuildContext context, SwiperPluginConfig config) {
            return Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  config.itemCount,
                      (index) => Container(
                    height: 10,
                    width: 10,
                    margin: 180.paddingTop + 3.paddingHoriz,
                    decoration: Decorations.kDecorationOnlyRadius(
                      // color: config.activeIndex == index
                      //     ? context.primaryColor
                      //     : context.outline,
                      color: config.activeIndex == index
                          ? context.primaryColor
                          : context.hintColor,
                      radius: 50,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            );
          },
        ),
        viewportFraction: 1,
        scale: 0.99,
        autoplay: true,
        autoplayDelay: 5000,
        autoplayDisableOnInteraction: true,
        allowImplicitScrolling: false,
      ),
    );
  }
}

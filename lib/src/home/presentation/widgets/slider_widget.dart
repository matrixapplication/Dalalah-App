import 'package:arabitac/src/main_index.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sliderIndex = 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(

        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: context.primaryColor,
            child: CarouselSlider.builder(
              itemCount: 1,
              options: CarouselOptions(
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
                    // setState(() {
                    //   sliderIndex = index;
                    //   print(index);
                    // });
                  }),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Image.asset(
                  AppImages.slider_car,
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: EdgeInsets.only(top: 0, left: 20, right: 20),
                child: Text(
                  context.strings.find_your_next_match,
                  style: context.labelLarge.copyWith(fontSize: 22),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 0, left: 20, right: 20),
              child: AnimatedSmoothIndicator(
                activeIndex: sliderIndex,
                count: 1,
                axisDirection: Axis.horizontal,
                effect: JumpingDotEffect(
                  dotColor: context.scaffoldBackgroundColor,
                  activeDotColor: context.colorScheme.surface,
                  dotHeight: 5,
                  dotWidth: 5,
                  spacing: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

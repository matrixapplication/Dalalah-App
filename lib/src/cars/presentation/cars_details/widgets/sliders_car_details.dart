import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/widgets/images/image_network.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

///  Created by harbey on 9/6/2023.
class SlidersCarDetails extends StatelessWidget {
  final List<String> images;

  SlidersCarDetails({required this.images});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Swiper(
        itemCount: images.length,
        index: images.length - 1,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: ImageNetwork(
              image: 'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
              height: 50,
              width: double.infinity,
              fit: BoxFit.fill,
              radius: 0,
            ),
          );
        },
        pagination: SwiperCustomPagination(
            builder: (BuildContext context, SwiperPluginConfig config) {
          return
            Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(config.itemCount, (index) => Container(
                margin: const EdgeInsetsDirectional.only(top: 200, start: 5, end: 5),
                color: config.activeIndex == index ? context.primaryColor : context.outline,
                alignment: Alignment.center,
                height: 2.5,
                width: 10,
              )),
            ),
          );
        }),
        viewportFraction: 1,
        scale: 0.99,
        autoplay: true,
        autoplayDelay: 2000,
        autoplayDisableOnInteraction: true,
        allowImplicitScrolling: false,
      ),
    );
  }
}

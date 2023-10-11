import 'package:delala/core/widgets/images/image_network.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../main_index.dart';

///  Created by harbey on 9/6/2023.
class SlidersCarDetails extends StatelessWidget {
  final List<String> images;

  SlidersCarDetails({required this.images});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 240,
          child: Swiper(
            itemCount: images.length,
            index: images.length - 1,
            itemBuilder: (BuildContext context, int index) {
              return ImageNetwork(
                padding: 20.paddingBottom,
                borderRadius: const BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(12),
                  bottomStart: Radius.circular(12),
                ),
                image:
                    'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/2020-Chevrolet-Corvette-Stingray/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=960',
                width: double.infinity,
                fit: BoxFit.fill,
              );
            },
            // duration: 3,
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
                        margin: 150.paddingTop + 3.paddingHoriz,
                        decoration: Decorations.kDecorationOnlyRadius(
                          // color: config.activeIndex == index
                          //     ? context.primaryColor
                          //     : context.outline,
                          color: config.activeIndex == index
                              ? Colors.white
                              : const Color(0xff7A7A7A),
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
        ),
        PositionedDirectional(
          bottom: 0,
          end: 10,
          child: AppCircularIconButton(
            icon: AppIcons.heart,
            color: AppColors.blue_31,
            backgroundColor: context.cardColor,
            shadowColor: context.cardColor.withOpacity(0.2),
            padding: 12,
            size: 22,
            margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
          ),
        ),
      ],
    );
  }
}

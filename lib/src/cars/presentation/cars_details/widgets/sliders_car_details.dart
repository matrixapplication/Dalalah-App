import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';
import '../../../../../core/widgets/buttons/app_circular_icon_button.dart';
import '../../../../main_index.dart';

///  Created by harby on 9/6/2023.
class SlidersCarDetails extends StatelessWidget {
  final double height;
  final bool isDialog;
  final List<String> images;

  SlidersCarDetails({super.key, required this.images, this.height = 300, this.isDialog = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDialog ? null : () => showImages(context),
      child: SizedBox(
        height: height,
        child: Swiper(
          itemCount: images.length,
          index: images.length - 1,
          itemBuilder: (BuildContext context, int index) {
            return ImageNetwork(
              padding: (isDialog ? 0 : 20).paddingBottom,
              borderRadius: const BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(12),
                bottomStart: Radius.circular(12),
              ),
              url: images[index],
              width: double.infinity,
              fit: isDialog ? BoxFit.contain : BoxFit.fill,
              // height: 245,
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
                      margin: (isDialog ? height - 50 : 150).paddingTop + 3.paddingHoriz,
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
    );
  }

  showImages(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            SlidersCarDetails(
              images: images,
              height: 400,
              isDialog: true,
            ),
            const PositionedDirectional(
              top: 0,
              start: 0,
              child: CustomBackButton(isPrimaryColor: true),
            ),
          ],
        );
      },
    );
  }
}

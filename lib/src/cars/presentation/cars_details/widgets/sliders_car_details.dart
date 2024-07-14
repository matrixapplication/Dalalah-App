import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';
import '../../../../main_index.dart';

///  Created by harby on 9/6/2023.
class SlidersCarDetails extends StatelessWidget {
  final double height;
  final bool isDialog;
  final List<String> images;
  final Function(int)? onIndexChanged;

  SlidersCarDetails({super.key, required this.images, this.height = 300, this.isDialog = false, this.onIndexChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDialog ? null : () => showImages(context),
      child: SizedBox(
        height: height,
        child: Swiper(
          itemCount: images.length,
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
                      margin: (isDialog ? height - 50 : 200).paddingTop + 3.paddingHoriz,
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
          onIndexChanged: onIndexChanged,
        ),
      ),
    );
  }

  showImages(BuildContext context) {
    StreamStateInitial<int> streamStateInitial = StreamStateInitial<int>();
    showModalBottomSheet(
      context: context,
isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (BuildContext context) {
        return Stack(
          children: [
            SlidersCarDetails(
              images: images,
              height: double.infinity,
              isDialog: true,
                onIndexChanged: (index) {
                  streamStateInitial.setData(index + 1);
                },
            ),
            const PositionedDirectional(
              top: 35,
              start: 0,
              child: CustomBackButton(isPrimaryColor: true),
            ),
             Align(
              alignment: AlignmentDirectional.topCenter,
              child: Padding(
                padding: 45.paddingTop,
                child: StreamBuilder<int>(
                  stream: streamStateInitial.stream,
                  initialData: 1,
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data}/${images.length}',
                      style: context.labelMedium.copyWith(fontSize: 20),
                    );
                  }
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

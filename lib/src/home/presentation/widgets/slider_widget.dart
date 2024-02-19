import 'package:card_swiper/card_swiper.dart';
import 'package:dalalah/core/utils/navigator.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:dalalah/src/main_index.dart';

import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/stream/stream_state_widget.dart';
import '../../domain/entities/slide.dart';

class SliderWidget extends StatelessWidget {
  final StreamStateInitial<List<Slide>?> slidesStream;
  const SliderWidget({
    Key? key,
    required this.slidesStream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sliderIndex = 0;
    // print('snapshot slide ${snapshot.f}');
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
      child: StreamStateWidget<List<Slide>?>(
          stream: slidesStream,
        builder: (context, snapshot) {
          return Swiper(
            itemCount: snapshot?.length ?? 0,
            index: (snapshot?.length ?? 0) - 1,
            itemBuilder: (BuildContext context, int index) {
              print('snapshot slide ${snapshot?[index]}');
              final slide = snapshot?[index];
              return  GestureDetector(
                onTap: () async {
                  print('slide?.showroomId ${slide?.showroomId}');
                  print('slide?.url ${slide?.url}');

                  if(slide?.showroomId != null && slide?.showroomId != 0){
                    pushNamed(Routes.showroomDetailsPage, arguments: slide?.showroomId);
                  } else if(slide?.url != null && slide!.url!.isNotEmpty){
                    String id = slide.url?.split('/').last ?? '';
                    pushNamed(slide.type == 'car' ? Routes.carDetailsPage : Routes.plateAppLink, arguments: int.parse(id));
                  }
                },
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ImageNetwork(
                      url: snapshot?[index].image ?? '',
                      fit: BoxFit.fill,
                      height: 200,
                      width: double.infinity,
                      radius: 0,
                    ),
                    Padding(
                      padding: 10.paddingAll,
                      child: Text(
                        snapshot?[index].title ?? '',
                        style: context.headlineLarge,
                      ),
                    )
                  ],
                ),
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
            autoplay: true,
            autoplayDisableOnInteraction: true,
            allowImplicitScrolling: false,
          );
        }
      ),
    );
  }
}

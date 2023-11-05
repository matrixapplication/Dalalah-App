import 'package:dalalah/src/main_index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/navigator.dart';
import '../widgets/background_images.dart';
import '../widgets/onboarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({Key? key}) : super(key: key);


  StreamStateInitial<bool> pageStream = StreamStateInitial();
  PageController? controller =
  PageController(initialPage: 0, viewportFraction: 1.0);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          reverse: true,
          itemCount: BackgroundImages.data.length,
          onPageChanged: (index) {
            this.index = index;
            if (index == BackgroundImages.data.length - 1) {
              pageStream.setData(true);
            } else {
              pageStream.setData(false);
            }
          },
          itemBuilder: (context, index) {
            return OnboardingItem(
              isOdd: index.isOdd,
              item: BackgroundImages.data[index],
            );
          },
        ),

        Container(
          width: double.infinity,
          padding: (kToolbarHeight).paddingVert + 20.paddingHoriz,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              skipTextButton(context),
              StreamBuilder<bool>(
                initialData: false,
                stream: pageStream.stream,
                builder: (context, snapShot){
                  return snapShot.data! ? startButton(context) : floatingActionButton(context, index: index);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget skipTextButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigators.pushNamedAndRemoveUntil(Routes.login),
      child: Text(
        context.strings.skip,
        style: context.labelMedium,
      ),
    );
  }

  floatingActionButton(BuildContext context, {required int index}) {
    print('index $index');
    return Stack(
      children: [
        FloatingActionButton(
          mini: true,
          backgroundColor: index.isOdd ? context.cardColor : context.primaryColor,
          onPressed: () {
            if (controller?.page!.toInt() == BackgroundImages.data.length - 2) {
              pageStream.setData(true);
              controller?.animateToPage(controller!.page!.toInt() + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            } else {
              controller?.animateToPage(controller!.page!.toInt() + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            }
          },
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: index.isOdd ? context.primaryColor : context.cardColor,
            size: 20,
          ),
        ),
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          margin: 12.paddingTop,
          child: AnimatedSmoothIndicator(
            activeIndex: index,
            count: 3,
            textDirection: TextDirection.ltr,
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              dotColor: context.gray_ec,
              activeDotColor: index.isOdd ? context.cardColor : context.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  startButton(BuildContext context){
    return GestureDetector(
      onTap: () => Navigators.pushNamedAndRemoveUntil(Routes.login),
      child: Center(
        child: Container(
          width: 244.19,
          height: 53.08,
          alignment: Alignment.center,
          decoration: ShapeDecoration(
            color: Color(0xFF0396BE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Text(
            'ابدأ',
            style: context.labelLarge.copyWith(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

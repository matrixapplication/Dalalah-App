import 'package:dalalah/src/main_index.dart';

import '../../../core/utils/navigator.dart';
import '../widgets/background_images.dart';
import '../widgets/onboarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
   OnBoardingScreen({Key? key}) : super(key: key);


  StreamStateInitial<bool> pageStream = StreamStateInitial();
  PageController? controller =
  PageController(initialPage: 0, viewportFraction: 1.0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: controller,
          reverse: true,
          itemCount: BackgroundImages.data.length,
          onPageChanged: (index) {
            if (index == BackgroundImages.data.length - 1) {
              pageStream.setData(true);
            } else {
              pageStream.setData(false);
            }
          },
          itemBuilder: (context, index) {
            return OnboardingItem(
              item: BackgroundImages.data[index],
            );
          },
        ),
        Padding(
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
                  return snapShot.data! ? startButton(context) : floatingActionButton(context);
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

  floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      mini: true,
      backgroundColor: context.blue_3F.withOpacity(0.50),
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
      child: Padding(
        padding: 7.paddingStart,
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 20,
        ),
      ),
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
          decoration: BoxDecoration(
            color: const Color(0x60143051),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFF5F4F4).withOpacity(0.1),
                blurRadius: 0,
                offset: Offset(0, 4),
                spreadRadius: 0,
              ),
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

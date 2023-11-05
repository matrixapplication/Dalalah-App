import 'package:dalalah/src/main_index.dart';
import 'onboarding_item.dart';

///  Created by harbey on 9/7/2023.
class BackgroundImages {

 static List<Widget> backgroundImages = [
   const SizedBox(),
    Image.asset(
      AppImages.on_boarding1,
      width: 300,
      // width: context.width * 0.8,
    ),
    Image.asset(
      AppImages.on_boarding2,
    ),
  ];


 static List<OnboardingModel> data = [
   OnboardingModel(
     image: AppImages.on_boarding1,
     title: "استمتع بالفخامة",
     description: "سيارات مميزة وفخمة يومياً. استمتع بالإثارة\nبسعر أقل",
     isImageStart: false,
   ),
   OnboardingModel(
     image: AppImages.on_boarding2,
     title: "تميز بالفخامة بلوحة سيارتك",
     description: "سيارات مميزة وفخمة يومياً. استمتع بالإثارة\nبسعر أقل",
     isImageStart: false,
   ),
   OnboardingModel(
     image: AppImages.on_boarding3,
     title: "دلالة العقارية استمتع بالرفاهية",
     description: "عقارات فخمة ومميزة. استمتع بالرفاهية\nبسعر أقل",
     isImageStart: false,
   ),
 ];

}



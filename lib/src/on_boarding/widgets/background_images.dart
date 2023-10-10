import 'package:arabitac/src/main_index.dart';
import 'onboarding_item.dart';

///  Created by harbey on 9/7/2023.
class BackgroundImages {

 static List<Widget> backgroundImages = [
    Image.asset(
      AppImages.on_boarding1,
      width: 200,
      // width: context.width * 0.8,
    ),
    Image.asset(
      AppImages.on_boarding2,
    ),
    const SizedBox(),
  ];


 static List<Widget> pages = [
   OnboardingItem(
       item: OnboardingModel(
         image: AppImages.on_boarding1,
         title: "Welcome to Arabitac",
         description:
         "Arabitac is a car rental app that allows you to rent a car in a few clicks",
         isImageStart: false,
       )),
   OnboardingItem(
       item: OnboardingModel(
         image: AppImages.on_boarding2,
         title: "Welcome to Arabitac",
         description:
         "Arabitac is a car rental app that allows you to rent a car in a few clicks",
         isImageStart: true,
       )),

   Padding(
     padding: 20.paddingAll,
     child: Image.asset(AppImages.on_boarding3),
   ),
 ];

}



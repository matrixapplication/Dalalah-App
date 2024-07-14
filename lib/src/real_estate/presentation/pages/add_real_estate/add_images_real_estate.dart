import 'package:dalalah/src/main_index.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/widgets/buttons/primary_outlined_buttons.dart';

class AddImagesRealEstateScreen extends BaseStatelessWidget {
   AddImagesRealEstateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: 16.paddingHoriz+80.paddingTop,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.images_real_estate,
              style: labelMedium.copyWith(
                  color: Colors.black
              ),
            ),
            Text(strings.add_main_image,
              style: labelMedium.copyWith(
                  color: Colors.grey
              ),
            ),
            10.ph,
            Container(
              width: double.infinity,
              decoration: Decorations.kDecorationBorder(
                radius: 8
              ),
              child: Padding(
                padding: 35.paddingVert,
                child: Column(
                  children: [
                    Image.asset(AppImages.image),
                    10.ph,
                    Container(
                      width: 140,
                      height: 40,
                      decoration: Decorations.kDecorationBorder(
                          radius: 4,
                        backgroundColor: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_a_photo,color: Colors.white,),
                          5.pw,
                          Text(strings.choose_image,
                          style: labelMedium.copyWith(
                              color: Colors.white),
                          ),

                        ],
                      ),
                    )
                  
                  ],
                ),
              ),
            ),
            32.ph,
            Text(strings.choose_image_mess,
              style: labelMedium.copyWith(
                  color: Colors.grey
              ),
            ),
            10.ph,
            Container(
              width: double.infinity,
              decoration: Decorations.kDecorationBorder(
                  radius: 8
              ),
              child: Padding(
                padding: 35.paddingVert,
                child: Column(
                  children: [
                    Image.asset(AppImages.image),
                    10.ph,
                    Container(
                      width: 140,
                      height: 40,
                      decoration: Decorations.kDecorationBorder(
                        radius: 4,
                        backgroundColor: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.add_a_photo,color: Colors.white,),
                          5.pw,
                          Text(strings.choose_image,
                            style: labelMedium.copyWith(
                                color: Colors.white),
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
            85.ph,
            PrimaryOutlinesButtons(
              title1: strings.share,
              title2: strings.back,
              onPressed1: () {
              },
              onPrevPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}

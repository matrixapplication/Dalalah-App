import 'package:delala/core/assets/app_images.dart';
import 'package:delala/core/decorations/decorations.dart';
import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/light_theme.dart';
import '../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../domain/entities/profile.dart';

///  Created by harbey on 9/3/2023.
class ProfileHeader extends StatelessWidget {
  final Profile? profile;

  const ProfileHeader({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      // decoration: Decorations.mainShapeDecoration(
      // borderRadius: const BorderRadiusDirectional.only(
      //   bottomStart: Radius.circular(8),
      //   bottomEnd: Radius.circular(8),
      // ),
      // ),
      decoration: Decorations.kDecorationBorderRadius(
        color: context.primaryColor,
        borderRadius: const BorderRadiusDirectional.only(
          bottomStart: Radius.circular(8),
          bottomEnd: Radius.circular(8),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                40.ph,
                // ImageNetworkText(
                //   image: profile?.image,
                //   text: profile?.name,
                //   size: 50,
                // ),
                ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(50),
                  child: Image.asset(
                    AppImages.img,
                    fit: BoxFit.fill,
                    width: 100,
                    height: 100,
                  ),
                ),
                17.ph,
                Text(
                  "Jorge David",
                  style: context.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                10.ph,
                Text(
                  "jorge@mail.com",
                  style: context.displaySmall,
                )
              ],
            ),
          ),
          PositionedDirectional(
            top: 40,
            end: 0,
            // child: Container(
            //   width: 150,
            //   height: 50,
            //   decoration: Decorations.kDecorationOnlyRadius(
            //       color: Colors.white, radius: 50),
            //   child: TabBarWidget(
            //     labelSize: 15,
            //     selectedLabelColor: Colors.white,
            //     indicatorDecoration: BoxDecoration(
            //       borderRadius: BorderRadiusDirectional.circular(20),
            //       color: AppColors.blue_49,
            //     ),
            //     tabs: [
            //       TabItemModel(
            //         label: "العربية",
            //         page: 0.ph,
            //       ),
            //       TabItemModel(
            //         label: "En",
            //         page: 0.ph,
            //       ),
            //     ],
            //   ),
            // ),
            child: SizedBox(
              width: 145,
              height: 60,
              child: AnimatedTabsBar(
                tabs: [
                  TabModel(
                    label: context.strings.arabic,
                  ),
                  TabModel(
                    label: "EN",
                  )
                ],
                children: [
                  0.ph,
                  0.ph,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dalalah/core/assets/app_images.dart';
import 'package:dalalah/core/decorations/decorations.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/images/image_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/light_theme.dart';
import '../../../../core/widgets/tabview/animated_tabs_bar.dart';
import '../../../../core/widgets/tabview/tabbar_widget.dart';
import '../../../settings/presentation/bloc/locale_cubit.dart';
import '../../../settings/presentation/bloc/locale_state.dart';
import '../../domain/entities/profile.dart';

///  Created by harby on 9/3/2023.
class ProfileHeader extends StatelessWidget {
  final Profile? profile;

  const ProfileHeader({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    print("dddddt ${profile?.image??''}");
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
                profile!.token != null ?
                ImageNetworkCircle(
                  image: profile?.image,
                  size: 80,
                ) : Image.asset(
                  AppImages.logo,
                  width: 80,
                  height: 80,
                ),
                17.ph,
                Text(
                  profile?.name ?? "",
                  style: context.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                10.ph,
                Text(
                  profile?.email ?? "",
                  style: context.displaySmall,
                )
              ],
            ),
          ),
          PositionedDirectional(
            top: 40,
            end: 0,
            child: SizedBox(
              width: 160,
              height: 60,
              child: BlocBuilder<LocaleCubit, LocalState>(
                bloc: LocaleCubit()..getLanguageData(),
                builder: (context, state) {
                  return AnimatedTabsBar(
                    initialIndex: state.language == context.en ? 1 : 0,
                    onTabSelected: (index) {
                      if (state.language == context.en) {
                        context.read<LocaleCubit>().setLanguageData(context.ar);
                      } else {
                        context.read<LocaleCubit>().setLanguageData(context.en);
                      }
                    },
                    tabs: [
                      TabModel(
                        label: context.strings.arabic,
                      ),
                      TabModel(
                        label: context.strings.english,
                      )
                    ],
                    children: [
                      0.ph,
                      0.ph,
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

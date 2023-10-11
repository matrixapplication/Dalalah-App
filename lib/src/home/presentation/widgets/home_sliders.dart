import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/src/home/presentation/widgets/search_text_field.dart';
import 'package:delala/src/home/presentation/widgets/slider_widget.dart';
import 'package:delala/src/home/presentation/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/decorations/decorations.dart';
import '../../../../core/widgets/buttons/app_icon.dart';
import 'filter_home.dart';

class HomeSliders extends StatelessWidget {
  const HomeSliders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: context.scaffoldBackgroundColor,
      padding: const EdgeInsets.only(bottom: 5),
      decoration: Decorations.kDecorationBottomRadius(
          color: context.scaffoldBackgroundColor),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.only(bottom: 30),
            decoration: Decorations.kDecorationBottomRadius(
                color: context.primaryColor),
            child: SliderWidget(),
          ),
          FilterHome(),
        ],
      ),
    );
  }
}

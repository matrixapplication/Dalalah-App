
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:arabitac/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

import '../core/routing/navigation_services.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(title),
      centerTitle: true,
      leading: TapEffect(onClick: (){
        NavigationService.goBack();
      }, child: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: primaryColor,
      )),
    );
  }
}
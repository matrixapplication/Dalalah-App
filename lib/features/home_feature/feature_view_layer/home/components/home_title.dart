import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:arabitac/core/resources/color.dart';
import 'package:arabitac/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  final String? title;
  const HomeTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText("$title") ,
          const CustomText("See All" , color: primaryOrangeColor,) ,
        ],
      ),
    );
  }
}
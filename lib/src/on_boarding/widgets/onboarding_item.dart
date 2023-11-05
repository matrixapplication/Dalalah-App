import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final bool isOdd;
  final OnboardingModel item;

  const OnboardingItem({
    super.key,
    this.isOdd = false,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOdd ? context.primaryColor : context.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (kToolbarHeight + 50).ph,
          Padding(
            padding: 30.paddingHoriz,
            child: Text(
              item.title,
              style: context.titleMedium.copyWith(color: isOdd ? context.cardColor : context.primaryColor),
            ),
          ),
          20.ph,
          Padding(
            padding: 30.paddingHoriz,
            child: Text(item.description, style: context.labelMedium.copyWith(color: isOdd ? context.gray_E1 : context.gray_65)),
          ),
          if(isOdd)
          20.ph,
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              if(!isOdd)
              Container(
                width: context.width * 0.7,
                height: context.width * 0.7,
                decoration: ShapeDecoration(
                  color: Color(0x9EF2F2F2),
                  shape: OvalBorder(),
                ),
              ),
              Image.asset(
                item.image,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OnboardingModel {
  String title;
  String description;
  String image;
  bool? isImageStart;

  OnboardingModel(
      {required this.title,
      required this.description,
      required this.image,
      this.isImageStart});
}

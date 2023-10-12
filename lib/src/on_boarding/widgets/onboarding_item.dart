import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 40.paddingStart,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            item.image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (kToolbarHeight + 50).ph,
          Text(
            item.title,
            style: context.titleLarge.copyWith(color: Colors.white),
          ),
          40.ph,
          Text(item.description, style: context.labelLarge),
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

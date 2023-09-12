import 'package:arabitac/core/exceptions/extensions.dart';
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
   //   padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                70.ph,
                Text(
                  item.title ?? '',
                  style: context.titleLarge
                      .copyWith(color: context.colorScheme.surface, fontSize: 25),
                ),
                30.ph,
                Text(
                  item.description ?? '',
                  style: context.displaySmall.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: item.isImageStart == true ?  AlignmentDirectional.centerStart : ( item.isImageStart == false ?AlignmentDirectional.centerEnd : AlignmentDirectional.center),
          //   child: Image.asset(item.image ?? '', fit: BoxFit.cover, height: 200),
          // ),
        ],
      ),
    );
  }
}

class OnboardingModel {
  String? title;
  String? description;
  String? image;
  bool? isImageStart;

  OnboardingModel(
      {this.title, this.description, this.image, this.isImageStart});
}

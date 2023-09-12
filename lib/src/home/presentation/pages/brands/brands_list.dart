import 'package:arabitac/core/exceptions/extensions.dart';
import 'package:arabitac/core/widgets/images/image_network.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';

///  Created by harbey on 9/5/2023.
class BrandsList extends StatelessWidget {
  final bool isHome;
  const BrandsList({Key? key, this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: isHome ? 6 : 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: isHome ? (16.paddingBottom + 16.paddingHoriz) : 16.paddingAll,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: Decorations.kDecorationBorderRadius(
            borderColor: context.outline,
            color: context.scaffoldBackgroundColor,
            radius: 8,
            borderWidth: 1.3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageNetwork(
                image:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPP9unyFq5H4PuKaRmW9bcIYFnvkHeVemueQ&usqp=CAU",
                fit: BoxFit.cover,
                size: 55,
              ),
              Text(
                "Marcedes",
                style: context.bodyLarge.copyWith(fontSize: 12),
              )
            ],
          ),
        );
      },
    );
  }
}

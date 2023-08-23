import 'package:arabitac/core/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import 'car_card.dart';

class LastUsedCar extends StatelessWidget {
  const LastUsedCar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 244.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,

          itemBuilder: (_, index) {
            return const CarCard();
          },
          itemCount: 8,
        ),
      ),
    );
  }
}
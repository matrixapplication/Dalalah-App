import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import 'cars_vertical_item.dart';

///  Created by harbey on 10/21/2023.
class CarsList extends StatelessWidget {
  final List<String> cars;
  const CarsList({Key? key, required this.cars}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: tasks.length,
      itemCount: cars.length,
      shrinkWrap: true,
      padding: 10.paddingHoriz,
      itemBuilder: (context, index) {
        return const CarVerticalItem(
          imageHasOnlyTopRadius: false,
          // task: tasks[index],
        );
      },
    );
  }
}

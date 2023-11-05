import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import 'cars_vertical_item.dart';

///  Created by harbey on 10/21/2023.
class CarsList extends StatelessWidget {
  final List<String> cars;
  final bool isCatItem;
  const CarsList({Key? key, required this.cars, this.isCatItem = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: tasks.length,
      itemCount: cars.length,
      shrinkWrap: true,
      padding: 10.paddingAll,
      itemBuilder: (context, index) {
        return const CarVerticalItem(
          imageHasOnlyTopRadius: false,
          isCatItem: false,
          // task: tasks[index],
        );
      },
    );
  }
}

import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../src/cars/presentation/cars_details/widgets/car_properties.dart';
import '../assets/app_icons.dart';

///  Created by harbey on 10/18/2023.
class MultiGridViewSelection extends StatelessWidget {
  final Function(List<CarProperty>) onSelected;

  MultiGridViewSelection({Key? key, required this.onSelected})
      : super(key: key);
  final List<CarProperty> properties = [
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
    CarProperty(
      title: "سعة المحرك",
      icon: AppIcons.timer,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<CarProperty> selected = [];
    return GridView.builder(
      itemCount: properties.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return StatefulBuilder(builder: (context, setState) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selected.contains(properties[index])
                    ? selected.remove(properties[index])
                    : selected.add(properties[index]);
              });
            },
            child: CarPropertyItem(
              height: 85,
              width: 85,
              radius: 16,
              textStyle: context.bodyMedium.copyWith(
                  fontSize: 12,
                  color: selected.contains(properties[index])
                      ? context.cardColor
                      : null),
              backgroundColor: selected.contains(properties[index])
                  ? context.primaryColor
                  : null,
              padding: 10.paddingAll,
              property: CarProperty(
                title: "سعة المحرك",
                icon: AppIcons.timer,
                color: selected.contains(properties[index])
                    ? context.cardColor
                    : null,
              ),
            ),
          );
        });
      },
    );
  }
}

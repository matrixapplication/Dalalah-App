import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';

///  Created by harbey on 10/12/2023.
class FilterItem extends BaseStatelessWidget {
  final String? title;
  final List<TextEditingController> controllers;

  FilterItem({Key? key, required this.controllers, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> itemsLetters = [
      strings.first_letter,
      strings.second_letter,
      strings.third_letter
    ];
    List<String> itemsNumber = [
      strings.first_number,
      strings.second_number,
      strings.third_number,
      strings.fourth_number
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: context.labelLarge,
        ),
        Row(
          children: List.generate(
            controllers.length,
            (index) => Expanded(
              child: CustomTextField(
                title: controllers.length == 3
                    ? itemsLetters[index]
                    : itemsNumber[index],
                controller: controllers[index],
                padding: 8.paddingHoriz,
                labelStyle: context.labelSmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

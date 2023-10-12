import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:delala/core/widgets/texts/column_texts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';

///  Created by harbey on 10/11/2023.
class PlatesDetailsProperty extends StatelessWidget {
  final String label;
  final String value;
  const PlatesDetailsProperty({Key? key, required this.label, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: 8.paddingAll,
      margin: 12.paddingBottom,
      decoration: Decorations.kDecorationBorderRadius(
        color: context.gray_fb,
        borderColor: context.gray_5c,
        radius: 10
      ),
      child: ColumnTexts(
        title: label,
        value: value,
        space: 12,
        padding: 5.paddingVert,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        titleStyle: context.displaySmall.copyWith(
          color: context.gray_ac,
        ),
        valueStyle: context.displaySmall.copyWith(
          color: context.gray_80,
        ),
      ),
    );
  }
}

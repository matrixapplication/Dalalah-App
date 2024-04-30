import 'package:dalalah/core/themes/colors.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/sub_custom_container.dart';

class ChipAd extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  const ChipAd({super.key, required this.text, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 2.paddingHoriz,
      child: CustomChip(
        backgroundColor: backgroundColor ?? AppColors.grey_d9,
        value: text,
        fontSize: 10,
        labelColor: backgroundColor == context.errorColor ? context.labelMedium.color : context.bodyMedium.color,
        padding: 3.paddingVert + 10.paddingHoriz,
          borderColor: Colors.transparent,
      ),
    );
  }
}

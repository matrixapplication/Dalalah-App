import 'package:flutter/material.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';

class RowButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPressed2;
  final EdgeInsetsGeometry? margin;
  const RowButtons({Key? key, this.title1, this.title2, this.onPressed1, this.onPressed2, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            child: PrimaryButton(
              title: title1,
              backgroundColor: theme.colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),

              onPressed: onPressed1,
            ),
          ),
          const SizedBox(width: 1.5),
          Expanded(
            child: PrimaryButton(
              title: title2,
              backgroundColor: theme.colorScheme.errorContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              onPressed: onPressed2,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';

import 'outlined_button.dart';

class PrimaryOutlinesButtons extends StatelessWidget {
  final String? title1;
  final String? title2;
  final Function()? onPressed1;
  final Function()? onPrevPressed;
  final EdgeInsetsGeometry? margin;

  const PrimaryOutlinesButtons(
      {Key? key,
      this.title1,
      this.title2,
      this.onPressed1,
      this.onPrevPressed,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: PrimaryButton(
              title: title1 ?? context.strings.next,
              backgroundColor: context.primaryColor,
              borderRadius: BorderRadius.circular(4),
              onPressed: onPressed1,
            ),
          ),
          if(onPrevPressed != null)
          ...[10.pw,
          Expanded(
            flex: 2,
            child: SecondaryButton(
              title: title2 ?? context.strings.back,
              borderColor: context.primaryColor,
              radius: 4,
              onPressed: onPrevPressed,
            ),
          ),]
        ],
      ),
    );
  }
}

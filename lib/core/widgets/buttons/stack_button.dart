import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/buttons/primary_outlined_buttons.dart';
import 'package:dalalah/core/widgets/buttons/row_buttons.dart';
import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';
import '../../routes/routes.dart';
import '../../utils/navigator.dart';

class StackButton extends BaseStatelessWidget {
  final Widget child;
  final Function() onNextPressed;
  final Function()? onPrevPressed;
  StackButton({super.key, required this.child, required this.onNextPressed, this.onPrevPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        child,
        Align(
          alignment: Alignment.bottomCenter,
          child: PrimaryOutlinesButtons(
            title1: strings.next,
            title2: strings.back,
            onPrevPressed: onPrevPressed,
            onPressed1: () {
              onNextPressed();
            },
          ),
        ),
      ],
    );
  }
}

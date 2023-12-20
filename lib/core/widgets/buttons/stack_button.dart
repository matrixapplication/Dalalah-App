import 'package:dalalah/core/commen/common_state.dart';
import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/buttons/primary_outlined_buttons.dart';
import 'package:dalalah/core/widgets/buttons/row_buttons.dart';
import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';
import '../../routes/routes.dart';
import '../../utils/navigator.dart';

class StackButton extends BaseStatelessWidget {
  final Widget child;
  final String? nextTitle;
  final Function() onNextPressed;
  final Function()? onPrevPressed;
  final StreamStateInitial<bool>? streamNextPressed;
  StackButton({super.key, required this.child, this.nextTitle, required this.onNextPressed, this.onPrevPressed, this.streamNextPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 5.paddingAll,
      child: Column(
        children: [
          Expanded(child: child),
          StreamBuilder<bool>(
            initialData: true,
            stream: streamNextPressed?.stream,
            builder: (context, snapshot) {
              return PrimaryOutlinesButtons(
                title1: nextTitle ?? strings.next,
                title2: strings.back,
                margin: 10.paddingTop,
                onPrevPressed: onPrevPressed,
                onPressed1: snapshot.data == false ? null : () {
                  onNextPressed();
                },
              );
            }
          ),
        ],
      ),
    );
  }
}

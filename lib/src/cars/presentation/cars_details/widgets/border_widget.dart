import 'package:delala/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/decorations/decorations.dart';

///  Created by harbey on 9/6/2023.
class BorderWidget extends StatelessWidget {
  final String? title;
  final EdgeInsetsGeometry? padding;
  final Widget child;

  const BorderWidget({Key? key, this.padding, required this.child, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: Decorations.kDecorationBorderWithRadius(
        radius: 10,
        borderWidth: 1.5,
        borderColor: context.dividerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (title != null) ...[
            Text(
              title ?? '',
              style: context.bodyLarge.copyWith(fontSize: 20),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              color: context.primaryColor,
              height: 1.2,
              width: 30,
            ),
          ],
          child,
        ],
      ),
    );
  }
}

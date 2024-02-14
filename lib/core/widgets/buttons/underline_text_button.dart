import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/navigator.dart';

class UnderlineTextButton extends StatelessWidget {
  final String title;
  final String? routeName;
  final Function()? onTap;
  const UnderlineTextButton({super.key, required this.title, this.routeName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {
       pushNamed(routeName ?? '');
      },
      child: Text(
        title,
        style: context.headlineSmall.copyWith(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

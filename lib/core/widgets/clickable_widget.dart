

import 'package:flutter/material.dart';

class ClickableWidget extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  const ClickableWidget({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: onTap,
      child: child,
    );
  }
}

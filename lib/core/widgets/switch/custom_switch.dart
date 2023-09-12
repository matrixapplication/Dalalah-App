import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatelessWidget {
  final void Function(bool) onToggle;
  final bool value;

  const CustomSwitch({Key? key, required this.onToggle, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: StatefulBuilder(
        builder: (context, setState) {
          return FlutterSwitch(
            width: 40,
            height: 25,
            padding: 5,
            toggleSize: 15,
            value: value,
            activeColor: theme.colorScheme.secondaryContainer.withOpacity(0.3),
            activeToggleColor: theme.colorScheme.secondaryContainer,
            inactiveColor: theme.hintColor,
            inactiveToggleColor: theme.hintColor.withOpacity(0.1),
            onToggle: onToggle,
          );
        }
      ),
    );
  }
}

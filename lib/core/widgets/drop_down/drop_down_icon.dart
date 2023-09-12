import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownIcon extends StatelessWidget {
  final String? value;
  final IconData? icon;
  final List<DropdownMenuItem>? items;
  final void Function(dynamic?)? onChanged;
  const DropDownIcon({Key? key, required this.items, this.value, this.onChanged, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Icon(
          icon ?? Icons.filter_alt,
          size: 30,
        ),
        items: items,
        onChanged: onChanged,

      ),
    );
  }
}

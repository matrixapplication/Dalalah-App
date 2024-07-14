import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/material.dart';

import '../../components/base_stateless_widget.dart';


class CustomRadioListTile extends BaseStatelessWidget {
   String title;
  final String groupValue;
  final Function(String?) onChanged;
   CustomRadioListTile(
      {super.key,
      required this.title,
      required this.groupValue,
      required this.onChanged});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  16.paddingBottom,
      child: Row(
        children: [

          Text(
           title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            fontSize: 17),
          ),
          12.pw,
          Transform.scale(
            scale: 1,
            child: Radio(
              activeColor: primaryColor,
              value: title,
              groupValue: groupValue,
              fillColor: MaterialStateProperty.all(primaryColor),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity:  const VisualDensity(horizontal: -4, vertical: -4),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}

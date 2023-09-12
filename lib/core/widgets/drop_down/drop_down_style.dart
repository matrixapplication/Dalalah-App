import 'package:flutter/material.dart';

InputDecoration inputDecoration(BuildContext context, IconData? prefixIcon) {
  return InputDecoration(
    isDense: true,
    fillColor: Theme.of(context).backgroundColor,
    enabled: true,
    filled: true,
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder(context),
    errorBorder: errorBorder,
    border: focusedBorder(context),
    contentPadding: prefixIcon == null ?  const EdgeInsetsDirectional.only(end: 10, start: 0) : EdgeInsets.zero,
    prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Theme.of(context).primaryColor, size: 22) : null,
    labelStyle: Theme.of(context).textTheme.bodyMedium,
  );
}

OutlineInputBorder  enabledBorder = OutlineInputBorder(
borderSide: BorderSide(color: Colors.grey.shade400),
borderRadius: const BorderRadius.all(Radius.circular(12)),
  gapPadding: 30,
);

OutlineInputBorder  errorBorder = const OutlineInputBorder(
borderSide: BorderSide(color: Colors.red, width: 2),
borderRadius: BorderRadius.all(Radius.circular(12)),
  gapPadding: 30,
);

BoxDecoration dropdownDecoration =  BoxDecoration(
borderRadius: BorderRadius.circular(12),
);
BoxDecoration buttonDecoration =  BoxDecoration(
  color: Colors.black12.withOpacity(0.03),
borderRadius: BorderRadius.circular(12),
  border: Border.all(color: Colors.grey.shade400),
);
EdgeInsetsDirectional  buttonPadding = const EdgeInsetsDirectional.only(start: 0);

Icon icon = const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.black54, size: 30,);
Icon iconOnClick({IconData? iconData}){
 return Icon(iconData ?? Icons.keyboard_arrow_up_sharp, color: Colors.black54, size: 30,) ;
}

OutlineInputBorder focusedBorder(BuildContext context) => OutlineInputBorder(
    borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
    borderRadius: const BorderRadius.all(Radius.circular(12)),
  gapPadding: 30,
  );

double buttonHeight = 50;
Widget hintText(BuildContext context,String title, {TextStyle? style}){
  return Text(
    title,
    style: style ?? Theme.of(context).textTheme.labelSmall,
  );
}

Widget labelText(String title){
  return Text(
    title,
  );
}
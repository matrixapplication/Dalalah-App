import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/resources/validation.dart';
import 'package:delala/core/widgets/drop_down/drop_down_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownField extends StatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? hint;
  final String? value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(dynamic)? onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  const DropDownField({Key? key, required this.items, this.title, this.hint, this.onChanged, this.prefixIcon, this.texStyle, this.value, this.iconWidget, this.isValidator = true, this.validator, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != null)
          20.ph,
       ...[ Text(
          title ?? '',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        5.ph,],
        DropdownButtonFormField2<DropDownItem>(
          isExpanded: true,
          decoration: InputDecoration(
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            // label: Text(
            //   hint ?? '',
            //   style: context.displaySmall,
            // ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.primaryColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colorScheme.secondary,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.outline,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            // Add more decoration..
          ),
          hint: Text(
            hint ?? '',
            style: context.displaySmall,
          ),
          items: items
              .map((item) => DropdownMenuItem<DropDownItem>(
            value: item,
            child: Text(
              item.title ?? '',
              style: context.titleSmall,
              textAlign: TextAlign.center,
            ),
          )).toList(),
          validator: isValidator ? (value) => Validation.validateRequired(value?.title ?? '') : null,
          onChanged: onChanged,
          onSaved: (value) {
            //  selectedValue = value.toString();
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}


// class DefaultDropDown extends StatelessWidget {
//   final List<DropdownMenuItem>? items;
//   final String? hintText;
//   final String? value;
//   final TextStyle? texStyle;
//   final IconData? prefixIcon;
//   final bool? isLoading;
//   final void Function(dynamic)? onChanged;
//   final bool isValidator;
//   const DefaultDropDown({Key? key, this.items, this.hintText, this.value, this.texStyle, this.prefixIcon, this.isLoading = false, this.onChanged, this.isValidator = true}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  isLoading! ? DropDownField(
//       prefixIcon: prefixIcon,
//       hint: hintText,
//   //    iconWidget: const LoadingWidget(size: 40, strokeWidth: 2.5),
//     ) : DropDownField(
//       prefixIcon: prefixIcon,
//       hint: hintText,
//       texStyle:Theme.of(context).textTheme.labelSmall,
//       items: items,
//       onChanged: onChanged,
//       isValidator: isValidator,
//     );
//   }
// }


class DropDownItem {
  final String? id;
  final String? title;
  final String? value;
  final IconData? icon;
  final Widget? child;
  const DropDownItem({this.id, this.title, this.value, this.icon, this.child});
}
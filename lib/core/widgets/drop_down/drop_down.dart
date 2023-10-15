import 'package:delala/core/exceptions/extensions.dart';
import 'package:delala/core/resources/validation.dart';
import 'package:delala/core/themes/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../assets/app_icons.dart';
import '../buttons/app_icon.dart';

class DropDownField extends StatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? hint;
  final dynamic value;
  final TextStyle? texStyle;
  final IconData? prefixIcon;
  final Widget? iconWidget;
  final void Function(dynamic)? onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? marginDropDown;

  const DropDownField(
      {Key? key,
      required this.items,
      this.title,
      this.hint,
      this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.value,
      this.iconWidget,
      this.isValidator = true,
      this.validator,
      this.style,
      this.margin,
      this.marginDropDown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? 0.paddingVert,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title ?? '',
              style: context.labelLarge,
            ),
            10.ph,
          ],
          Padding(
            padding: marginDropDown ?? EdgeInsets.zero,
            child: DropdownButtonFormField2<DropDownItem>(
              isExpanded: true,
              value: value,
              decoration: InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                contentPadding: 10.paddingEnd,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey_DB,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey_DB,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey_DB,
                  ),
                  borderRadius: BorderRadius.circular(8),
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
                          style: context.textTheme.labelLarge!.copyWith(
                            color: AppColors.blue_49,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ))
                  .toList(),
              validator: isValidator
                  ? (value) => Validation.validateRequired(value?.title ?? '')
                  : null,
              onChanged: onChanged,
              onSaved: (value) {
                //  selectedValue = value.toString();
              },
              buttonStyleData: ButtonStyleData(
                padding: 0.paddingAll,
              ),
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: 10.paddingEnd,
                  child: AppIcon(
                    icon: AppIcons.down_arrow,
                    color: AppColors.blue_49,
                    size: 10,
                  ),
                ),
                iconSize: 10,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
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

import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/resources/validation.dart';
import 'package:dalalah/core/themes/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../assets/app_icons.dart';
import '../../decorations/decorations.dart';
import '../buttons/app_icon.dart';
import '../pagination/loading_widget.dart';
import '../text-field/custom_text_field.dart';

class DropDownField extends StatelessWidget {
  final List<DropDownItem> items;
  final String? title;
  final String? hint;
  final double? radius;
  final double? height;
  final Color? fillColor;
  final Color? hintColor;
  final Color? dropDownIconColor;
  final dynamic valueId;
  final TextStyle? texStyle;
  final String? prefixIcon;
  final Widget? iconWidget;
  final void Function(DropDownItem?)? onChanged;
  final bool isValidator;
  final String? Function(dynamic)? validator;
  final TextStyle? style;
  final TextStyle? titleStyle;
  final double? hintFontSize;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? marginDropDown;
  final bool isDecoration;
  final InputDecoration? inputDecoration;
  final bool isLoading;
  final bool disabled;
  final Color? backgroundColor;

  const DropDownField(
      {Key? key,
      required this.items,
      this.title,
      this.hint,
      this.onChanged,
      this.prefixIcon,
      this.texStyle,
      this.valueId,
      this.iconWidget,
      this.isValidator = true,
      this.validator,
      this.style,
      this.margin,
      this.marginDropDown,
      this.height,
      this.fillColor,
      this.hintColor,
      this.dropDownIconColor,
      this.hintFontSize, this.radius, this.titleStyle,
      this.isDecoration = false,
      this.inputDecoration,
      this.isLoading = false,
      this.disabled = false,
      this.backgroundColor,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? colorBorderSide = isDecoration ? context.cardColor : context.colorScheme.outline;
    Color? fillColor = context.cardColor;
    TextEditingController controller = TextEditingController();
    return Container(
      margin: margin ?? 10.paddingVert - 8.paddingBottom,
      decoration: isDecoration
          ?  Decorations.kDecorationField() : null,
      // color: isDecoration ? null : backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title ?? '',
              style: titleStyle ?? context.bodySmall,
            ),
            5.ph,
          ],
          Padding(
            padding: marginDropDown ?? EdgeInsets.zero,
            child: DropdownButtonFormField2<DropDownItem>(
              isExpanded: true,
              value: getDropDownItemById(valueId.toString()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: inputDecoration ?? InputDecoration(
                // Add Horizontal padding using menuItemStyleData.padding so it matches
                // the menu padding when button's width is not specified.
                // constraints: BoxConstraints(
                //   minHeight: height ?? 48,
                //   maxHeight: height ?? 48,
                // ),
                filled: true,
                fillColor: fillColor,
                contentPadding: 2.paddingEnd + 0.paddingVert,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorBorderSide ?? context.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(radius ?? 12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorBorderSide ?? context.colorScheme.outline,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(radius ?? 12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: colorBorderSide ?? context.colorScheme.outline,
                  ),
                  borderRadius: BorderRadius.circular(radius ?? 12),
                ),
                prefixIcon: iconWidget ??
                    (prefixIcon != null
                        ? AppIcon(
                            padding: 10.paddingAll,
                            icon: prefixIcon!,
                            color: dropDownIconColor ?? context.primaryColor,
                          )
                        : null),

                errorStyle: context.displaySmall.copyWith(color: context.errorColor),
                // Add more decoration..
              ),
              hint: Text(
                hint ?? '',
                style: context.displaySmall
                    .copyWith(fontSize: hintFontSize ?? 12, color: hintColor),
                overflow: TextOverflow.ellipsis,
              ),
              items: items
                  .map((item) => DropdownMenuItem<DropDownItem>(
                        value: item,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            item.title ?? '',
                            style: context.textTheme.labelLarge!.copyWith(
                              color: AppColors.blue_49,
                            ),
                            textAlign: TextAlign.center,
                          ),
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
                // padding: 10.paddingVert,

                height: height,
              ),
              iconStyleData: IconStyleData(
                icon: Padding(
                  padding: 10.paddingEnd,
                  child: isLoading ?  const SmallLoading() : AppIcon(
                    icon: AppIcons.down_arrow,
                    color: dropDownIconColor ?? AppColors.blue_49,
                    size: 8,
                  ),
                ),
                iconSize: 10,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                // offset: Offset(0, 0),
                openInterval: const Interval(0.25, 0.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 8),
                  boxShadow: [
                    BoxShadow(
                      color: context.primaryColor.withOpacity(0.15),
                      offset: const Offset(0, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              dropdownSearchData: items.length < 10 ? null :
              DropdownSearchData(
                searchInnerWidgetHeight: 50,
                searchController: controller,
                searchInnerWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    hintText: context.strings.search_here,
                    controller: controller,
                    prefixIcon: Icon(Icons.search, color: context.primaryColor),
                    isValidator: false,
                  ),
                ),
                searchMatchFn: (DropdownMenuItem<DropDownItem> item, String text) {
                  return item.value?.title
                      ?.toLowerCase()
                      .contains(text.toLowerCase()) ??
                      false;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  DropDownItem? getDropDownItemById(String id) {
    if (id.isEmpty) return null;
    return items.firstWhereOrNull((element) => element.id == id);
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

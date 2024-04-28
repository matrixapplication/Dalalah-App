import 'package:dalalah/src/main_index.dart';

class CustomTextField extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? title;
  final bool? isPassword;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Widget? prefixIcon;
  final String? iconPath;
  final Widget? suffixIcon;
  final int? maxLines;
  final Color? colorBorderSide;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool isValidator;
  final double? maxHeight;
  final TextStyle? labelStyle;
  final int?maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;

  CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.title,
    this.isPassword,
    this.onTap,
    this.onChanged,
    this.validator,
    this.inputDecoration,
    this.keyboardType,
    this.fillColor,
    this.hintStyle,
    this.textAlign,
    this.prefixIcon,
    this.maxLines,
    this.colorBorderSide,
    this.margin,
    this.contentPadding,
    this.suffixIcon,
    this.radius,
    this.iconPath,
    this.isValidator = true,
    this.maxHeight,
    this.labelStyle,
    this.maxLength,
    this.inputFormatters,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: margin ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            10.ph,
            SizedBox(
              child: Text(
                title ?? '',
                style: labelStyle ?? context.bodySmall,
              ),
            ),
            5.ph,
          ],
          TextFormField(
            onTap: onTap,
            controller: controller,
            readOnly: onTap != null,
            textAlign: textAlign ?? TextAlign.start,
            maxLines: maxLines,
            maxLength: maxLength,

            keyboardType: keyboardType,
            style: context.bodyMedium,
            cursorColor: context.primaryColor,
            autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            inputFormatters: inputFormatters,
            decoration: inputDecoration ??
                InputDecoration(
                  // label: Text(
                  //   'hint' ?? '',
                  //   style: context.displaySmall,
                  // ),
                  //        labelText: labelText ?? '',

                  //         label: Text(labelText ?? '', style: theme.textTheme.headlineMedium!.copyWith()),
                  hintText: hintText,
                  hintStyle: hintStyle ??
                      context.displaySmall.copyWith(fontSize: 12),
                  fillColor: fillColor ?? theme.colorScheme.background,
                  filled: true,
                  constraints: BoxConstraints(
                      maxHeight: maxHeight ?? 70, minHeight: maxHeight ?? 45),
                  prefixIcon: iconPath != null
                      ? AppIcon(
                          padding: const EdgeInsets.all(12),
                          icon: iconPath!,
                          color: theme.hintColor,
                          size: 20,
                        )
                      : prefixIcon,
                  suffixIcon: suffixIcon,
                  contentPadding: contentPadding ?? 10.paddingAll,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(radius ?? 12)),
                    borderSide:
                        BorderSide(color: colorBorderSide ?? context.outline),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(radius ?? 12)),
                    borderSide:
                        BorderSide(color: colorBorderSide ?? context.outline),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(radius ?? 12)),
                    borderSide:
                        BorderSide(color: colorBorderSide ?? context.outline),
                  ),
                ),
            validator: (isValidator && validator == null)
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return strings.this_field_is_required;
                    }
                    // check if all characters are empty
                    else if (value.replaceAll(' ', '').isEmpty) {
                      return strings.this_field_is_required;
                    }
                    return null;
                  }
                : validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

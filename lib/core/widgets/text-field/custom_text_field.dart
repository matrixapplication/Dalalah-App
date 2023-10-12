import 'package:delala/src/main_index.dart';

class CustomTextField extends BaseStatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
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
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final bool? isValidator;
  final double? maxHeight;
  final TextStyle? labelStyle;

  CustomTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.labelText,
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
      this.padding,
      this.contentPadding,
      this.suffixIcon,
      this.radius,
      this.iconPath,
      this.isValidator = true,
      this.maxHeight,
      this.labelStyle,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null) ...[
            10.ph,
            SizedBox(
              child: Text(
                labelText ?? '',
                style: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
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
            keyboardType: keyboardType,
            style: theme.textTheme.headlineMedium,
            cursorColor: context.primaryColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: inputDecoration ??
                InputDecoration(
                  // label: Text(
                  //   'hint' ?? '',
                  //   style: context.displaySmall,
                  // ),
                  //        labelText: labelText ?? '',

                  //         label: Text(labelText ?? '', style: theme.textTheme.headlineMedium!.copyWith()),
                  hintText: hintText,
                  hintStyle: hintStyle ?? theme.textTheme.displaySmall,
                  fillColor: fillColor ?? theme.colorScheme.background,
                  filled: true,
                  constraints: BoxConstraints(
                    maxHeight: maxHeight ?? 45,
                  ),
                  prefixIcon: iconPath != null
                      ? AppIcon(
                          padding: const EdgeInsets.all(12),
                          icon: iconPath!,
                          color: theme.hintColor,
                          size: 20,
                        )
                      : prefixIcon,
                  suffixIcon: suffixIcon,
                  contentPadding: contentPadding ??
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
            validator: (isValidator! && validator == null)
                ? (value) {
                    if (value == null || value.isEmpty) {
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

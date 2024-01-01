import 'package:dalalah/src/main_index.dart';

import '../../../../core/resources/validation.dart';
import '../../../home/presentation/widgets/tap_effect.dart';

class AuthTextField extends StatelessWidget {
  final double? width;

  final String? hint;

  final TextEditingController? controller;

  final void Function()? onTep;

  final String? Function(String?)? validator;
  final Function(String?)? onChange;

  final Function(String?)? onSubmit;

  final bool isPassword;

  final String? prefixIcon;
  final Icon? prefixIconData;

  final bool? error;
  final TextInputType? keyboardType;
  final bool isColor;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const AuthTextField({
    Key? key,
    this.width,
    this.hint,
    this.controller,
    this.onTep,
    this.validator,
    this.onChange,
    this.onSubmit,
    this.isPassword = false,
    this.prefixIcon,
    this.error,
    this.prefixIconData,
    this.keyboardType,
    this.isColor = true,
    this.maxLength,
    this.inputFormatters,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool secure = true;
    return Container(
      margin: 10.paddingBottom,
      decoration: Decorations.kDecorationField(),
      child: StatefulBuilder(builder: (context, setState) {
        return TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            style: context.textTheme.bodyMedium,
            keyboardType: keyboardType,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                //   constraints: BoxConstraints(minHeight: 80.h, maxHeight: 80.h),
                fillColor: Colors.white,
                filled: true,
                contentPadding: 10.paddingVert,
                hintText: hint ?? "Username",
                prefixIcon: prefixIconData ??
                    (prefixIcon != null
                        ? AppIcon(
                            padding: const EdgeInsets.all(12),
                            icon: prefixIcon!,
                            color: isColor ? context.primaryColor : null,
                            size: 20,
                          )
                        : null),
                hintStyle: context.displaySmall,
                suffixIcon: isPassword
                    ? TapEffect(
                        onClick: () {
                          setState(() {
                            secure = !secure;
                          });
                        },
                        child: secure
                            ? Icon(
                                Icons.visibility_off_outlined,
                                color: context.primaryColor,
                              )
                            : Icon(
                                Icons.visibility_outlined,
                                color: context.primaryColor,
                              ))
                    : const SizedBox()),
            controller: controller,
            onTap: onTep,
            //      onChanged: onChange,
            onSaved: onSubmit,
            validator: validator ??
                (value) => Validation.validateRequired(value ?? ''),
            obscureText: isPassword ? secure : false);
      }),
    );
  }
}

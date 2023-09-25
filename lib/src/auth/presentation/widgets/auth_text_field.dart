import 'package:arabitac/src/main_index.dart';

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

  const AuthTextField(
      {Key? key,
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
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool secure = true;
    return Container(
      margin: 10.paddingBottom,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.15),
          offset: const Offset(0, 0),
          blurRadius: 10,
        ),
      ], borderRadius: BorderRadius.circular(8.h)),
      child: StatefulBuilder(
        builder: (context, setState) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            style: context.textTheme.headlineMedium,
            decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
             //   constraints: BoxConstraints(minHeight: 80.h, maxHeight: 80.h),
                fillColor: Colors.white,
                filled: true,
              //  contentPadding: EdgeInsets.symmetric(vertical: 30.h , horizontal: 10.w),
                hintText: hint ?? "Username",
                prefixIcon: prefixIconData ?? (prefixIcon != null
                    ? AppIcon(
                        padding: const EdgeInsets.all(12),
                        icon: prefixIcon!,
                        color: context.primaryColor,
                        size: 20,
                      )
                    : null),
                hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: context.primaryColorDark, fontWeight: FontWeight.w400),
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
            validator: validator ?? (value) =>  Validation.validateRequired(value ?? ''),
            obscureText: isPassword!
                    ? secure
                    : false
          );
        }
      ),
    );
  }
}

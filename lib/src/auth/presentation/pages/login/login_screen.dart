import 'package:arabitac/core/resources/validation.dart';

import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/login_params.dart';
import '../../widgets/auth_text_field.dart';

class LoginScreen extends BaseStatelessWidget {
  final Function(LoginParams)? onPressed;

  LoginScreen({Key? key, this.onPressed}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(strings.welcome,
                style:
                context.titleLarge.copyWith(color: context.outlineVariant)),
            5.ph,
            Text(strings.please_login_to_your_account,
                style:
                context.bodyMedium.copyWith(color: context.outlineVariant)),
            Padding(
              padding: 8.h.paddingHoriz + 20.h.paddingVert,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  AuthTextField(
                    hint: context.strings.phone_number,
                    prefixIcon: AppIcons.smartphone,
                    controller: phoneNumberController,
                    validator: (phone) => Validation.validatePhone(phone ?? ''),
                  ),
                  20.ph,
                  AuthTextField(
                    isPassword: true,
                    hint: context.strings.password,
                    prefixIcon: AppIcons.lock,
                    controller: passwordController,
                    validator: (password) => Validation.validatePhone(password ?? ''),
                  ),

                  PrimaryButton(
                    title: strings.login.toUpperCase(),
                    radius: 30.r,
                    height: 42.h,
                    margin: EdgeInsets.only(
                        top: 20.h, bottom: 20.h, left: 50.w, right: 50.w),
                    onPressed: () {
                      onPressed!(LoginParams(
                        phoneNumber: phoneNumberController.text,
                          password: passwordController.text));
                    },
                  ),
                  Text(strings.forgot_password, style: context.displaySmall),
                  40.h.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(strings.dont_have_an_account,
                          style: context.displaySmall),
                      5.w.pw,
                      GestureDetector(
                        onTap: () {
                          Navigators.pushNamed(Routes.register);
                        },
                        child: Text(
                          strings.create_new_now,
                          style: context.headlineMedium.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

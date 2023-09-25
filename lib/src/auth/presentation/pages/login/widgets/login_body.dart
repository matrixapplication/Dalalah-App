import '../../../../../../core/resources/validation.dart';
import '../../../../../../core/widgets/buttons/underline_text_button.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/login_params.dart';
import '../../../widgets/auth_text_field.dart';

class LoginBody extends BaseStatelessWidget {
  final bool isUser;
  final GlobalKey<FormState> formKey;
  final Function(LoginParams)? onLogin;

  LoginBody({Key? key, this.onLogin, this.isUser = true, required this.formKey}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 8.paddingHoriz + 16.paddingTop,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTextField(
              hint: isUser ? context.strings.phone_number : context.strings.id_number,
              prefixIcon: isUser ? AppIcons.smartphone : AppIcons.id_card,
              controller: emailController,
              validator: (phone) => Validation.validatePhone(phone ?? ''),
            ),
            10.ph,
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
                  top: 20.h, left: 50.w, right: 50.w),
              onPressed: () {
                onLogin!(LoginParams(
                    email: emailController.text,
                    password: passwordController.text,
                ),
                );
              },
            ),
            12.h.ph,
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(strings.dont_have_an_account,
                      style: context.displaySmall),
                  5.w.pw,
                  UnderlineTextButton(
                    title: strings.create_new_now,
                    routeName: Routes.register,
                  ),
                ],
              ),
            ),
            10.h.ph,
            Text(strings.or,
                style: context.displaySmall),
            10.h.ph,
            UnderlineTextButton(
              title: strings.as_guest,
              routeName: Routes.navigationPages,
            ),
          ],
        ),
      ),
    );
  }
}

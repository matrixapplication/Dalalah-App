import '../../../../../../core/resources/validation.dart';
import '../../../../../../core/widgets/buttons/underline_text_button.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/login_params.dart';
import '../../../widgets/auth_text_field.dart';

class LoginBody extends BaseStatelessWidget {
  final bool isUser;
  final Function(LoginParams)? onLogin;

  LoginBody({Key? key, this.onLogin, this.isUser = true}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              hint: isUser
                  ? context.strings.phone_number
                  : context.strings.id_number,
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
              radius: 30,
              height: 42,
              margin: EdgeInsets.only(top: 20, left: 50, right: 50),
              onPressed: () {
                if (_formKey.currentState!.validate())
                  onLogin!(
                    LoginParams(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
              },
            ),
            12.ph,
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(strings.dont_have_an_account,
                      style: context.displaySmall),
                  5.pw,
                  UnderlineTextButton(
                    title: strings.create_new_now,
                    routeName: Routes.register,
                  ),
                ],
              ),
            ),
            10.ph,
            Text(strings.or, style: context.displaySmall),
            10.ph,
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

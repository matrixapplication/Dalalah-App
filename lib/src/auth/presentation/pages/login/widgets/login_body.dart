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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.strings.welcome,
                style:
                context.titleMedium.copyWith()),
            12.ph,
            Text(context.strings.please_login_to_your_account,
                style:
                context.bodySmall.copyWith(fontSize: 12)),
            20.ph,
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
              height: 48,
              margin: EdgeInsets.only(top: 50, left: 35, right: 35),
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
            Align(
              alignment: Alignment.center,
              child: Text(strings.forgot_password,
                  style: context.bodySmall.copyWith(fontSize: 10)),
            ),
          ],
        ),
      ),
    );
  }
}

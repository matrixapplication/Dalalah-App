import '../../../../../core/resources/validation.dart';
import '../../../../main_index.dart';
import '../../widgets/auth_text_field.dart';

class NewPasswordScreen extends BaseStatelessWidget {
  final Function(String password) onForgotPasswordParams;

  NewPasswordScreen({Key? key, required this.onForgotPasswordParams})
      : super(key: key);

  bool notMatches = false;

  TextEditingController newPasswordController = TextEditingController();

  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              strings.enter_new_password,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge!
            ),
            20.ph,
            AuthTextField(
              isPassword: true,
              hint: context.strings.password,
              prefixIcon: AppIcons.lock,
              controller: newPasswordController,
              validator: (password) => Validation.validatePhone(password ?? ''),
            ),
            10.ph,
            AuthTextField(
              isPassword: true,
              hint: context.strings.password,
              prefixIcon: AppIcons.lock,
              controller: confirmNewPasswordController,
              validator: (password) => Validation.validatePhone(password ?? ''),
            ),
            PrimaryButton(
              title: strings.confirm,
              radius: 30,
              height: 48,
              margin: const EdgeInsets.only(top: 40, left: 35, right: 35),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onForgotPasswordParams(newPasswordController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

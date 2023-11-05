import '../../../../main_index.dart';
import '../../widgets/auth_text_field.dart';

class EnterPhoneNumberScreen extends BaseStatelessWidget {
  final Function(String) onEnterPhoneNumber;

  EnterPhoneNumberScreen({Key? key, required this.onEnterPhoneNumber})
      : super(key: key);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              strings.forgot_password_title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge,
            ),
            20.ph,
            AuthTextField(
              controller: emailController,
              hint: strings.email,
              prefixIcon: AppIcons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            30.ph,
            PrimaryButton(
              title: strings.send,
              radius: 30,
              height: 48,
              margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onEnterPhoneNumber(emailController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

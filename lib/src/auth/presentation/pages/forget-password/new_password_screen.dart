import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';
import '../../../data/models/forgot_password_params.dart';

class NewPasswordScreen extends BaseStatelessWidget {
  final Function(ForgotPasswordParams) onForgotPasswordParams;

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
          children: [
            // Text(
            //   strings.your_account_has_been_recovered_set_new_password,
            //   textAlign: TextAlign.center,
            //   style: theme.textTheme.headlineLarge!.copyWith(
            //     fontSize: 22,
            //   ),
            // ),
            // CustomTextField(
            //   controller: newPasswordController,
            //   hintText: strings.new_password,
            //   iconPath: AppIcons.lockOutline,
            //   isPassword: true,
            //   padding: const EdgeInsets.only(bottom: 20, top: 30),
            // ),
            // CustomTextField(
            //   controller: confirmNewPasswordController,
            //   hintText: strings.confirm_new_password,
            //   iconPath: AppIcons.lockOutline,
            //   isPassword: true,
            // ),
            const Spacer(),
            PrimaryButton(
              title: strings.confirm,
              radius: 8,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onForgotPasswordParams(ForgotPasswordParams(
                    newPassword: newPasswordController.text,
                    confirmPassword: confirmNewPasswordController.text,
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

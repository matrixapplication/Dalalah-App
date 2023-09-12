import '../../../../../core/widgets/text-field/custom_text_field.dart';
import '../../../../main_index.dart';

class EnterPhoneNumberScreen extends BaseStatelessWidget {
  final Function(String) onEnterPhoneNumber;

  EnterPhoneNumberScreen({Key? key, required this.onEnterPhoneNumber})
      : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();
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
          children: [
            // Text(
            //   strings.forget_password_message,
            //   textAlign: TextAlign.center,
            //   style: theme.textTheme.headlineLarge,
            // ),
            CustomTextField(
              controller: phoneNumberController,
              hintText: strings.phone_number,
              iconPath: AppIcons.callOutline,
              keyboardType: TextInputType.phone,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            const Spacer(),
            PrimaryButton(
              title: strings.confirm,
              radius: 8,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onEnterPhoneNumber(phoneNumberController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

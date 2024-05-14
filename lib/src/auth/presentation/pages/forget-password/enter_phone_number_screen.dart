import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';

import '../../../../main_index.dart';
import '../../widgets/auth_text_field.dart';

class EnterPhoneNumberScreen extends BaseStatelessWidget {
  final bool isUser;
  final Function(String) onEnterPhoneNumber;

  EnterPhoneNumberScreen(
      {Key? key, required this.onEnterPhoneNumber, this.isUser = true})
      : super(key: key);

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Stack(
        children: [
          const CustomBackButton(),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  strings.forgot_password_title,
                  textAlign: TextAlign.center,
                  style: headlineLarge.copyWith(fontSize: 20),
                ),
                50.ph,
                Text(
                  isUser ? strings.forgot_password_mobile_desc : strings.forgot_password_id_desc,
                  textAlign: TextAlign.center,
                  style: bodyMedium,
                ),
                20.ph,
                AuthTextField(
                  controller: emailController,
                  hint: isUser ? strings.phone_number : strings.code,
                  prefixIcon: isUser ? AppIcons.phone : AppIcons.id_card,
                  keyboardType: isUser
                      ? TextInputType.emailAddress
                      : TextInputType.number,

                ),
                30.ph,
                PrimaryButton(
                  title: strings.send,
                  radius: 30,
                  height: 48,
                  margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      onEnterPhoneNumber(isUser
                          ? emailController.text
                          : emailController.text);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

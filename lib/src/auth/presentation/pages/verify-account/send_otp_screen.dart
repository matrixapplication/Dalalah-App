import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';

import '../../../../main_index.dart';
import '../../../../profile/domain/entities/profile.dart';
import '../../widgets/auth_text_field.dart';

class SendOTPScreen extends BaseStatelessWidget {
  final Profile profile;
  final Function(String) onEnterPhoneNumber;

  SendOTPScreen({Key? key, required this.profile, required this.onEnterPhoneNumber})
      : super(key: key);

  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isUser = profile.isUser();
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
                  strings.send_otp_title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineLarge,
                ),
                20.ph,
                AuthTextField(
                  controller: phoneController,
                  hint: isUser ? strings.phone_number : strings.email,
                  prefixIcon:  isUser ? AppIcons.phone : AppIcons.email,
                  keyboardType: TextInputType.phone,
                ),
                30.ph,
                PrimaryButton(
                  title: strings.send,
                  radius: 30,
                  height: 48,
                  margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      onEnterPhoneNumber('966${phoneController.text}');
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

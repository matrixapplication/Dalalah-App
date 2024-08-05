import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';

import '../../../../../core/resources/validation.dart';
import '../../../../installment/domain/entities/roles.dart';
import '../../../../main_index.dart';
import '../../widgets/auth_text_field.dart';

class EnterPhoneNumberScreen extends BaseStatelessWidget {
  final String type;
  final Function(String) onEnterPhoneNumber;

  EnterPhoneNumberScreen(
      {Key? key, required this.onEnterPhoneNumber, this.type = Roles.USER})
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
                  type !=Roles.SHOWROOM ? strings.forgot_password_mobile_desc : strings.forgot_password_id_desc,
                  textAlign: TextAlign.center,
                  style: bodyMedium,
                ),
                20.ph,
                AuthTextField(
                  controller: emailController,
                  hint:  type !=Roles.SHOWROOM  ? strings.phone_number : strings.code,
                  prefixIcon:  type !=Roles.SHOWROOM  ? AppIcons.phone : AppIcons.id_card,
                  keyboardType:  type !=Roles.SHOWROOM
                      ? TextInputType.emailAddress
                      : TextInputType.number,
                  validator: (phone) => Validation.validatePhoneRequired(phone ?? ''),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],

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
        ],
      ),
    );
  }
}

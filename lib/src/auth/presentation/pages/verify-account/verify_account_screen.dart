import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';

import '../../../../main_index.dart';
import '../../../../../core/widgets/text-field/custom_pin_code.dart';

class VerifyAccountScreen extends BaseStatelessWidget {
  final Function() onResend;
  final Function(String) onPinCode;

  VerifyAccountScreen({Key? key,required this.onResend, required this.onPinCode}) : super(key: key);

  TextEditingController pinCodeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            10.ph,
            Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomBackButton()),
            100.ph,
            Text(
              strings.we_sent_you_verification_code,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium,
            ),
            40.ph,
            Text(strings.enter_verification_code_continue,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium!),
            16.ph,
            CustomPinCode(
              pinCodeController: pinCodeController,
            ),
            20.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  strings.i_did_not_receive_code,
                  textAlign: TextAlign.center,
                  style: context.displaySmall.copyWith(
                    color: context.scrim,
                  ),
                ),
                4.pw,
                GestureDetector(
                  onTap: () {
                    pinCodeController.clear();
                    onResend();
                  },
                  child: Text(strings.resend,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineSmall!),
                ),
              ],
            ),
            PrimaryButton(
              title: strings.confirm_code,
              radius: 30,
              height: 48,
              margin: const EdgeInsets.only(top: 40, left: 35, right: 35),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  onPinCode(pinCodeController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

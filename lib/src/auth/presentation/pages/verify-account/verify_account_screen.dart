import 'package:dalalah/core/widgets/scaffold/back_button_icon.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

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
            timerWidget(),
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
                  child: Row(
                    children: [
                      Text(strings.resend_after,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall!),
                      5.pw,
                      timer(),
                    ],
                  ),
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

  Widget timerWidget() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '${strings.not_receive_code_with_in} ',
        style: displayMedium,
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.top,
            child: timer(),
          ),
        ],
      ),
    );
  }

  Widget timer() {
    return TimerCountdown(
      format: CountDownTimerFormat.minutesSeconds,
      timeTextStyle: headlineMedium,
      // colonsTextStyle: kTextSemiBold.copyWith(
      //     color: const Color(0xffFF0000), fontSize: 29),
      enableDescriptions: false,
      endTime: DateTime.now().add(
        const Duration(
          seconds: 120,
        ),
      ),
      spacerWidth: 0,
      onEnd: () {
        // isSendAgain.setData(true);
      },
    );
  }
}

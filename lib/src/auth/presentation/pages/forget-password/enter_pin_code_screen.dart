
import '../../../../main_index.dart';
import '../../../../../core/widgets/text-field/custom_pin_code.dart';



class EnterPinCodeScreen extends BaseStatelessWidget {
  final Function(String) onPinCode;
  EnterPinCodeScreen({Key? key, required this.onPinCode}) : super(key: key);
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
          children: [
            // Text(
            //   strings.enter_code_recover_your_account,
            //   textAlign: TextAlign.center,
            //   style: theme.textTheme.headlineLarge!.copyWith(
            //     fontSize: 22,
            //   ),
            // ),
            // Text(
            //   strings.text_message_has_been_sent_your_registered_phone_number,
            //   textAlign: TextAlign.center,
            //     style: theme.textTheme.displaySmall,
            // ),
            CustomPinCode(
              pinCodeController: pinCodeController,
            ),
            // GestureDetector(
            //   onTap: () {
            //     pinCodeController.clear();
            //   },
            //   child: Text(
            //     strings.resend,
            //     textAlign: TextAlign.center,
            //   ),
            //
            // ),
            const Spacer(),
            PrimaryButton(
              title: strings.confirm,
              radius: 8,
              onPressed: (){
                if(formKey.currentState!.validate()){
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

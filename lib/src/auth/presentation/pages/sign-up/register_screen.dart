import '../../../../../core/resources/validation.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../main_index.dart';
import '../../../data/models/register_params.dart';
import '../../widgets/auth_text_field.dart';

class RegisterScreen extends BaseStatelessWidget {
  final Function(RegisterParams)? onRegister;

  RegisterScreen({Key? key, this.onRegister}) : super(key: key);

  static final TextEditingController fullNameController =
      TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: 10.paddingHoriz + 8.paddingTop,
      margin: 16.paddingHoriz + (180).paddingTop + 50.paddingBottom,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: Decorations.shapeDecorationShadow(colorShadow: context.primaryColor, radius: 30),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.strings.welcome_to,
                  style:
                  context.titleMedium.copyWith()),
              20.ph,
              AuthTextField(
                hint: strings.full_name,
                prefixIcon: AppIcons.user,
                controller: fullNameController,
              ),
              AuthTextField(
                hint: strings.email,
                prefixIcon: AppIcons.email,
                controller: emailController,
                validator: (phone) => Validation.validateEmail(phone ?? ''),
              ),
              AuthTextField(
                hint: context.strings.phone_number,
                prefixIcon: AppIcons.smartphone,
                controller: phoneNumberController,
                // validator: (phone) => Validation.validatePhone(phone ?? ''),
              ),
              AuthTextField(
                hint: context.strings.whatsapp,
                prefixIcon: AppIcons.whatsapp,
                controller: whatsappController,
                  isColor: false,
                // validator: (phone) => Validation.validatePhone(phone ?? ''),
              ),
              DropDownField(
                items: [DropDownItem(title: 'الرياض'), DropDownItem(title: 'جدة'), DropDownItem(title: 'الدمام')],
                hint: context.strings.city,
                prefixIcon: AppIcons.location_2,
                isDecoration: true,
                onChanged: (value) {

                },
              ),
              10.ph,
              AuthTextField(
                isPassword: true,
                hint: context.strings.password,
                prefixIcon: AppIcons.lock,
                controller: passwordController,
                validator: (password) =>
                    Validation.validatePassword(password ?? ''),
              ),
              // AuthTextField(
              //   isPassword: true,
              //   hint: context.strings.password,
              //   prefixIcon: AppIcons.lock,
              //   controller: confirmPasswordController,
              //   validator: (password) => Validation.validateConfirmPassword(
              //       password ?? '', passwordController.text),
              // ),
              PrimaryButton(
                title: strings.create.toUpperCase(),
                radius: 30,
                height: 48,
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 40, right: 40),
                onPressed: () {
                //  onRegisterPressed();

                  Navigators.pushNamedAndRemoveUntil(Routes.navigationPages);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(strings.dont_have_an_account,
                      style: context.displaySmall),
                  5.pw,
                  GestureDetector(
                    onTap: () {
                      Navigators.pop();
                    },
                    child: Text(
                      strings.login,
                      style: context.headlineMedium.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  onRegisterPressed() {
    if (formKey.currentState!.validate()) {
      onRegister!(
        RegisterParams(
          name: fullNameController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          password: passwordController.text,
          passwordConfirmation: confirmPasswordController.text,
          fcmToken: '',
        ),
      );
    }
  }
}

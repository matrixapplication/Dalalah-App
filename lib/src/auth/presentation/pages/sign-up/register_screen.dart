import '../../../../../core/resources/validation.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../main_index.dart';
import '../../../data/models/register_params.dart';
import '../../widgets/auth_text_field.dart';

class RegisterScreen extends BaseStatelessWidget {
  final Function(RegisterParams)? onRegister;

  RegisterScreen({Key? key, this.onRegister}) : super(key: key);

  static final TextEditingController fullNameController = TextEditingController();

  static final TextEditingController emailController = TextEditingController();

  static final TextEditingController phoneNumberController = TextEditingController();

  static final TextEditingController passwordController = TextEditingController();

  static final TextEditingController confirmPasswordController = TextEditingController();

  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 20.paddingHoriz + 20.paddingTop,
      height: 0.68.sh,
      margin: 16.paddingAll+ 30.paddingTop,
      decoration: Decorations.shapeDecorationShadow(colorShadow: context.primaryColor),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                isPassword: true,
                hint: context.strings.password,
                prefixIcon: AppIcons.lock,
                controller: passwordController,
                validator: (password) => Validation.validatePassword(password ?? ''),
              ),
              AuthTextField(
                isPassword: true,
                hint: context.strings.password,
                prefixIcon: AppIcons.lock,
                controller: confirmPasswordController,
                validator: (password) => Validation.validateConfirmPassword(password ?? '', passwordController.text),
              ),
              PrimaryButton(
                title: strings.create.toUpperCase(),
                radius: 30.r,
                height: 42.h,
                margin: EdgeInsets.only(
                    top: 20.h, bottom: 20.h, left: 40.w, right: 40.w),
                onPressed: () {
                  onRegisterPressed();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(strings.dont_have_an_account, style: context.displaySmall),
                  5.w.pw,
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

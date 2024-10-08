import 'package:dalalah/src/installment/domain/entities/roles.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/resources/validation.dart';
import '../../../../../../core/utils/navigator.dart';
import '../../../../../../core/utils/notification_service.dart';
import '../../../../../../core/widgets/buttons/underline_text_button.dart';
import '../../../../../main_index.dart';
import '../../../../data/models/login_params.dart';
import '../../../widgets/auth_text_field.dart';

class LoginBody extends BaseStatelessWidget {
  final String type;
  final Function(LoginParams)? onLogin;

  LoginBody({Key? key, this.onLogin, this.type = Roles.USER}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if(kDebugMode){
     emailController = TextEditingController(text: kReleaseMode ? '' : type==Roles.USER ? 'test22@gmail.com' :
     type== Roles.REALESTATEDEVELOPERS?'123456789':'1480');
     passwordController = TextEditingController(text: kReleaseMode ? '' :  type==Roles.USER  ? '123456' :
     type== Roles.REALESTATEDEVELOPERS? '123456':'123456789');
    }
    return SingleChildScrollView(
      padding: 8.paddingHoriz + 16.paddingTop,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.strings.welcome,
                style:
                context.titleMedium.copyWith()),
            12.ph,
            Text(context.strings.please_login_to_your_account,
                style:
                context.bodySmall.copyWith(fontSize: 12)),
            20.ph,
            AuthTextField(
              hint:type==Roles.USER ? context.strings.email_or_phone :
              type== Roles.REALESTATEDEVELOPERS?context.strings.phone_number:context.strings.code,
              prefixIcon: type==Roles.USER? AppIcons.email : type== Roles.REALESTATEDEVELOPERS?
              AppIcons.phone:AppIcons.id_card,
              controller: emailController,
              maxLength: type== Roles.REALESTATEDEVELOPERS?10:null,
              keyboardType: type==Roles.USER ? TextInputType.emailAddress : TextInputType.number,
             // validator: (phone) =>  type== Roles.REALESTATEDEVELOPERS? Validation.validatePhone(phone ?? ''):null,
            ),
            10.ph,
            AuthTextField(
              isPassword: true,
              hint: context.strings.password,
              prefixIcon: AppIcons.lock,
              controller: passwordController,
              validator: (password) => Validation.validatePassword(password ?? ''),
            ),
         //   if(isUser)
            Padding(
              padding: 10.paddingHoriz,
              child: GestureDetector(
                onTap: () {
                  pushNamed(Routes.enterPhoneNumberPage, arguments:type);
                },
                child:  Text(strings.forgot_password,
                    style: context.bodySmall.copyWith(fontSize: 12)),
              ),
            ),
            PrimaryButton(
              title: strings.login.toUpperCase(),
              radius: 30,
              height: 48,
              margin: const EdgeInsets.only(top: 20, left: 35, right: 35),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // I send token in bloc not here
                 // String token = await FirebaseNotification().getToken() ?? '';
                  onLogin!(
                    LoginParams(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  );
                }
              },
            ),

            20.ph,
            Center(
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(strings.dont_have_an_account,
                        style: context.displaySmall),
                    5.pw,
                    UnderlineTextButton(
                      title: strings.create_new_now,
                      routeName: Routes.register,
                    ),
                  ],
                ),
              ),
            ),
            20.ph,
            Align(
              alignment: Alignment.center,
              child:  UnderlineTextButton(
                title: strings.login_as_guest,
                onTap: () {
                 pushNamedAndRemoveUntil(Routes.navigationPages);
                },
              ),
            ),
            100.ph,
          ],
        ),
      ),
    );
  }
}

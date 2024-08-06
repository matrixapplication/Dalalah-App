import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/widgets/checkbox/custom_checkbox.dart';
import 'package:dalalah/core/widgets/snack_bar/snack_bar_manager.dart';

import '../../../../../core/resources/validation.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/utils/notification_service.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../installment/domain/entities/roles.dart';
import '../../../../main_index.dart';
import '../../../../profile/presentation/widgets/edit_profile_image.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../../settings/domain/entities/about_us_types_.dart';
import '../../../data/models/register_params.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/showroom_register_types.dart';

class UserRegisterScreen extends BaseStatelessWidget {
  final List<City> cities;
  final String registerType;
  final Function(RegisterParams)? onRegister;

  UserRegisterScreen(
      {Key? key,
      this.onRegister,
      required this.cities,
      this.registerType = Roles.USER})
      : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController ownerNameArController = TextEditingController();
  TextEditingController ownerNameEnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController descriptionArController = TextEditingController();
  TextEditingController descriptionEnController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int cityId = 0;
  String type = Roles.SHOWROOM;
  File file = File('');
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthTextField(
              hint: registerType!=Roles.USER ? strings.name_ar : strings.full_name,
              prefixIcon: AppIcons.user,
              controller:
              registerType!=Roles.USER ? nameArController : fullNameController,
            ),

            if (registerType!=Roles.USER)
              AuthTextField(
                hint: strings.name_en,
                prefixIcon: AppIcons.user,
                controller: nameEnController,
              ),
            if (registerType!=Roles.USER)
              Column(
                children: [
                  AuthTextField(
                    hint: strings.owner_name_ar,
                    prefixIcon: AppIcons.user,
                    controller: ownerNameArController,
                  ),
                  AuthTextField(
                    hint: strings.owner_name_en,
                    prefixIcon: AppIcons.user,
                    controller: ownerNameEnController,
                  ),
                  AuthTextField(
                    hint: strings.description_ar,
                    prefixIcon: AppIcons.description,
                    controller: descriptionArController,
                  ),
                  AuthTextField(
                    hint: strings.description_en,
                    prefixIcon: AppIcons.description,
                    controller: descriptionEnController,
                  ),
                ],
              ),

            AuthTextField(
              hint: strings.email,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: AppIcons.email,
              controller: emailController,
              validator: (phone) => Validation.validateEmail(phone ?? ''),
            ),

            AuthTextField(
              hint: context.strings.phone_number,
              prefixIcon: AppIcons.smartphone,
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              // validator: (phone) => Validation.validatePhoneRequired(phone ?? ''),
              validator: (phone) =>  type== Roles.REALESTATEDEVELOPERS? Validation.validatePhone(phone ?? ''): Validation.validatePhoneRequired(phone ?? ''),

              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            AuthTextField(
              hint: context.strings.whatsapp,
              prefixIcon: AppIcons.whatsapp,
              keyboardType: TextInputType.phone,
              controller: whatsappController,
              isColor: false,
              validator: (phone) => Validation.validatePhone(phone ?? ''),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            if(registerType==Roles.REALESTATEDEVELOPERS)
            AuthTextField(
              hint: context.strings.license_number,
              prefixIcon: AppIcons.id_card,
              controller: licenseNumberController,
              keyboardType: TextInputType.number,
              validator: (phone) => Validation.validateOnlyNumbers(phone ?? ''),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            DropDownField(
              items: cities.map((e) =>
                      DropDownItem(id: e.id?.toString() ?? '', title: e.name))
                  .toList(),
              hint: context.strings.city,
              prefixIcon: AppIcons.location_2,
              margin: 10.paddingHoriz,
              isDecoration: true,
              onChanged: (value) {
                cityId = int.parse(value?.id ?? '0');
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
            if (registerType==Roles.SHOWROOM)
              ShowroomRegisterTypes(
                onChange: (value) {
                  type = value;
                },
              ),

            if (registerType!=Roles.USER)
              EditProfileImage(
                image: '',
                onSelectImage: (file) {
                  this.file = file;
                },
              ),
            // StatefulBuilder(
            //     builder: (context, setState) {
            //       return PrimaryButton(
            //         title: strings.upload_logo,
            //         radius: 12,
            //         height: 48,
            //         backgroundColor: context.cardColor,
            //         textColor: context.primaryColor,
            //         elevation: 2,
            //         margin: const EdgeInsets.only(
            //             top: 20, bottom: 20, left: 40, right: 40),
            //         onPressed: () async {
            //           final picker = await HelperMethods.getImagePicker();
            //           file = File(picker?.path ?? '');
            //         },
            //       );
            //     }
            // ),
            CustomCheckbox(title: strings.i_agree_to_the_terms_and_conditions,
            isUnderline: true,
            onChanged: (value) {
              isAgree = value;
              },
              onTextTap: () {
                pushNamed(Routes.aboutUs, arguments: AboutUsTypes.TERMS_AND_CONDITIONS);
              },
            ),
            PrimaryButton(
              title: strings.create.toUpperCase(),
              radius: 30,
              height: 48,
              margin: const EdgeInsets.only(
                  top: 20, bottom: 20, left: 40, right: 40),
              onPressed: () {
                onRegisterPressed();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(strings.dont_have_an_account, style: context.displaySmall),
                5.pw,
                GestureDetector(
                  onTap: () {
                    pop();
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
            200.ph,
          ],
        ),
      ),
    );
  }

  onRegisterPressed() async {
    if (formKey.currentState!.validate()) {
      if (!isAgree) {
        SnackBarManager.showErrorSnackBar(strings.please_agree_to_terms_and_conditions);
        return;
      }
      if (registerType==Roles.SHOWROOM && file.path.isEmpty) {
        SnackBarManager.showErrorSnackBar(strings.please_upload_logo);
        return;
      }
      onRegister!(
        RegisterParams(
          type: registerType==Roles.SHOWROOM ? type : '',
          name: fullNameController.text,
          ownerNameAr: ownerNameArController.text,
          ownerNameEn: ownerNameEnController.text,
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
          // address: addressController.text,
          descriptionAr: descriptionArController.text,
          descriptionEn: descriptionEnController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          password: passwordController.text,
          cityId: cityId,
          whatsapp: whatsappController.text,
          logo: file,
          fcmToken: await FirebaseNotification().getToken(),
          licenseNumber: licenseNumberController.text
        ),
      );
    }
  }
}

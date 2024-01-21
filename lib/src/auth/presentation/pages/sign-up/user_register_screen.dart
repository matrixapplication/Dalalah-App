import 'dart:io';

import 'package:dalalah/core/utils/helper_methods.dart';

import '../../../../../core/resources/validation.dart';
import '../../../../../core/utils/navigator.dart';
import '../../../../../core/widgets/drop_down/drop_down.dart';
import '../../../../installment/domain/entities/roles.dart';
import '../../../../main_index.dart';
import '../../../../profile/presentation/widgets/edit_profile_image.dart';
import '../../../../sell_car/domain/entities/city.dart';
import '../../../data/models/register_params.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/showroom_register_types.dart';

class UserRegisterScreen extends BaseStatelessWidget {
  final List<City> cities;
  final bool isShowroom;
  final Function(RegisterParams)? onRegister;

  UserRegisterScreen(
      {Key? key,
      this.onRegister,
      required this.cities,
      this.isShowroom = false})
      : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController ownerNameArController = TextEditingController();
  TextEditingController ownerNameEnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController addressArController = TextEditingController();
  TextEditingController addressEnController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int cityId = 0;
  String type = Roles.SHOWROOM;
  File file = File('');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isShowroom)
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      hint: isShowroom ? strings.name_ar : strings.full_name,
                      prefixIcon: AppIcons.user,
                      controller:
                          isShowroom ? nameArController : fullNameController,
                    ),
                  ),
                  if (isShowroom)
                    Expanded(
                      child: AuthTextField(
                        hint: strings.name_en,
                        prefixIcon: AppIcons.user,
                        controller: nameEnController,
                        margin: 10.paddingEnd,
                      ),
                    ),
                ],
              ),
            if (isShowroom)
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
                      margin: 10.paddingEnd,
                    ),  AuthTextField(
                    hint: strings.address_ar,
                    prefixIcon: AppIcons.location_2,
                    controller: addressArController,
                  ),
                    AuthTextField(
                      hint: strings.address_en,
                      prefixIcon: AppIcons.location_2,
                      controller: addressEnController,
                    ),
                ],
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
              keyboardType: TextInputType.phone,
              validator: (phone) => Validation.validatePhone(phone ?? ''),
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
            DropDownField(
              items: cities
                  .map((e) =>
                      DropDownItem(id: e.id?.toString() ?? '', title: e.name))
                  .toList(),
              hint: context.strings.city,
              prefixIcon: AppIcons.location_2,
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
            if (isShowroom)
              ShowroomRegisterTypes(
                onChange: (value) {
                  type = value;
                },
              ),

            if (isShowroom)
            EditProfileImage(
              image: '',
              onSelectImage: (file){
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
            200.ph,
          ],
        ),
      ),
    );
  }

  onRegisterPressed() {
    if (formKey.currentState!.validate()) {
      onRegister!(
        RegisterParams(
          type: isShowroom ? type : '',
          name: fullNameController.text,
          ownerNameAr: ownerNameArController.text,
          ownerNameEn: ownerNameEnController.text,
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
          addressAr: addressArController.text,
          addressEn: addressEnController.text,
          email: emailController.text,
          phone: phoneNumberController.text,
          password: passwordController.text,
          cityId: cityId,
          whatsapp: whatsappController.text,
          logo: file,
          fcmToken: '',
        ),
      );
    }
  }
}

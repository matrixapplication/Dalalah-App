import 'dart:io';

import 'package:dalalah/src/installment/domain/entities/roles.dart';

import '../../../../core/resources/validation.dart';
import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/drop_down/drop_down.dart';
import '../../../auth/data/models/register_params.dart';
import '../../../main_index.dart';
import '../../../sell_car/domain/entities/city.dart';
import '../../domain/entities/profile.dart';
import '../widgets/edit_profile_image.dart';
import '../widgets/edit_text_form_field.dart';

class EditProfileScreen extends BaseStatelessWidget {
  final Profile profile;
  final List<City> cities;
  final Function(RegisterParams params) onEdit;
  final Function(File file) onEditImage;

  EditProfileScreen({Key? key, required this.profile, required this.cities, required this.onEdit, required this.onEditImage}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ownerNameEnController = TextEditingController();
  TextEditingController ownerNameArController = TextEditingController();
  TextEditingController nameArController = TextEditingController();
  TextEditingController nameEnController = TextEditingController();
  TextEditingController descArController = TextEditingController();
  TextEditingController descEnController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController anotherPhone1Controller = TextEditingController();
  TextEditingController anotherPhone2Controller = TextEditingController();
  TextEditingController whatsAppController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController taxCardController = TextEditingController();
  TextEditingController commercialController = TextEditingController();
  int cityId = 0;

   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? imageFile;
  File? taxCard;
  File? commercial;
  bool isVisibility =false;

  @override
  Widget build(BuildContext context) {
    _initData();
    return AppScaffold(
      bottomNavigationBar: editButton(),
      backgroundColor: context.secondaryContainer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              EditProfileImage(
              image: profile.image ?? '',
                onSelectImage: (file){
                if(profile.role != Roles.REALESTATEDEVELOPERS){
                  onEditImage(file);
                  imageFile=file;
                }
                },
              ),
              if(profile.role == Roles.USER)
              EditTextField(
                title: strings.full_name,
                controller: fullNameController,
              ),
              if(profile.role != Roles.USER)
              Column(
                children: [
                  EditTextField(
                    title: strings.owner_name_ar,
                    controller: ownerNameArController,
                  ),
                  EditTextField(
                    title: strings.owner_name_en,
                    controller: ownerNameEnController,
                  ),
                  EditTextField(
                    title: strings.name_ar,
                    controller: nameArController,
                  ),
                  EditTextField(
                    title: strings.name_en,
                    controller: nameEnController,
                  ),

                  EditTextField(
                    title: strings.description_ar,
                    controller: descArController,
                    isValidator: false,
                  ),
                  EditTextField(
                    title: strings.description_en,
                    controller: descEnController,
                    isValidator: false,
                  ),
                ],
              ),

                EditTextField(
                title: strings.phone_number,
                controller: phoneController,
                keyboardType: TextInputType.phone,
                validator: (phone) => Validation.validatePhone(phone ?? ''),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              EditTextField(
                title: strings.whatsapp_number,
                controller: whatsAppController,
                keyboardType: TextInputType.phone,
                validator: (phone) => Validation.validatePhone(phone ?? ''),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ],
              ),
              EditTextField(
                title: strings.another_phone_1,
                controller: anotherPhone1Controller,
                keyboardType: TextInputType.phone,
                // validator: (phone) => Validation.validatePhone(phone ?? ''),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              EditTextField(
                title: strings.another_phone_2,
                controller: anotherPhone2Controller,
                keyboardType: TextInputType.phone,
                // validator: (phone) => Validation.validatePhone(phone ?? ''),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              if(profile.role == Roles.SHOWROOM)
                StatefulBuilder(builder: (context,setState){
                  return  EditTextField(
                      isPdf: true,
                      controller: taxCardController,
                      onTap: ()async{
                        taxCard=await HelperMethods.pickPdf();
                        taxCardController.text=taxCard?.path.characters.toString()??'';
                        setState((){});
                      },
                      title: strings.tax_card,
                      widget:
                      Row(
                        children: [
                          Expanded(child:  Text(taxCardController.text,style: const TextStyle(color: Colors.blue),),),
                          if(taxCard!=null)
                            InkWell(
                              onTap: ()async{
                                HelperMethods.viewPdf(context, taxCard!);
                                // setState((){
                                // isVisibility =!isVisibility;
                                //   });
                              },
                              child: Icon(isVisibility==false?Icons.visibility:Icons.visibility,color: isVisibility==false?Colors.grey:Colors.blue,),
                            )
                        ],
                      )

                  );
                }),
              if(profile.role == Roles.SHOWROOM)
                StatefulBuilder(builder: (context,setState){
                  return  EditTextField(
                      isPdf: true,
                      controller: commercialController,
                      onTap: ()async{
                        commercial=await HelperMethods.pickPdf();
                        commercialController.text=commercial?.path.characters.toString()??'';
                        setState((){});
                      },
                      title: strings.file_commercial,
                      widget:
                      Row(
                        children: [
                          Expanded(child:  Text(commercialController.text,style: TextStyle(color: Colors.blue),),),
                          if(commercial!=null)
                            InkWell(
                          onTap: ()async{
                               HelperMethods.viewPdf(context, commercial!);
                              // setState((){
                              // isVisibility =!isVisibility;
                              //   });
                              },
                               child: Icon(isVisibility==false?Icons.visibility:Icons.visibility,color: isVisibility==false?Colors.grey:Colors.blue,),
                              )
                        ],
                      )

                  );
                }),

                EditTextField(
                title: strings.city,
                widget:  DropDownField(
                  items: cities.map((e) => DropDownItem(id: e.id?.toString() ?? '', title: e.name)).toList(),
                  inputDecoration: const InputDecoration(),
                  valueId: cityId,
                  prefixIcon: AppIcons.location_2,
                  onChanged: (value) {
                    cityId = int.parse(value?.id ?? '0');
                  },
                ),
              ),
              EditTextField(
                title: strings.change_password,
                controller: passwordController,
                isPassword: true,
                isValidator: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  editButton(){
   return PrimaryButton(
      title: strings.save,
      onPressed: onEditPressed,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    //  padding: const EdgeInsets.symmetric(vertical: 12),
    );
  }

  onEditPressed(){
    if (formKey.currentState!.validate()) {
      onEdit(
        RegisterParams(
          name: fullNameController.text,
          ownerNameAr: ownerNameArController.text,
          ownerNameEn: ownerNameEnController.text,
          nameAr: nameArController.text,
          nameEn: nameEnController.text,
          descriptionAr: descArController.text,
          descriptionEn: descEnController.text,
          // address: descArController.text,
          email: emailController.text,
          commercial: commercial,
          taxCard: taxCard,
          phone: phoneController.text,
          anotherPhone1: anotherPhone1Controller.text,
          anotherPhone2: anotherPhone2Controller.text,
          password: passwordController.text,
          whatsapp: whatsAppController.text,
          cityId: cityId,
          logo: profile.role == Roles.REALESTATEDEVELOPERS?imageFile:null
        ),
      );
    }
  }

  _initData() {
    fullNameController.text = profile.name ?? '';
    ownerNameArController.text = profile.ownerNameAr ?? '';
    ownerNameEnController.text = profile.ownerNameEn ?? '';
    nameArController.text = profile.nameAr ?? '';
    nameEnController.text = profile.nameEn ?? '';
    descArController.text = profile.descriptionAr ?? '';
    descEnController.text = profile.descriptionEn ?? '';
    emailController.text = profile.email ?? '';
    phoneController.text = profile.phone  ?? '';
    anotherPhone1Controller.text = profile.anotherPhone1 ?? '';
    anotherPhone2Controller.text = profile.anotherPhone2 ?? '';
    whatsAppController.text = profile.whatsApp ?? '';
    cityId = profile.city?.id ?? 0;
  }
}
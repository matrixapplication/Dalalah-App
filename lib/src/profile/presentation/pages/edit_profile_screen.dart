import 'dart:io';

import '../../../auth/data/models/register_params.dart';
import '../../../main_index.dart';
import '../../domain/entities/profile.dart';
import '../widgets/edit_profile_image.dart';
import '../widgets/edit_text_form_field.dart';

class EditProfileScreen extends BaseStatelessWidget {
  final Profile profile;
  final Function(RegisterParams params) onEdit;
  final Function(File file) onEditImage;

  EditProfileScreen({Key? key, required this.profile, required this.onEdit, required this.onEditImage}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  onEditImage(file);
                },
              ),
              EditTextField(
                title: strings.full_name,
                controller: fullNameController,
              ),
              EditTextField(
                title: strings.email,
                controller: emailController,
              ),
              EditTextField(
                title: strings.phone_number,
                controller: phoneController,
              ),
              EditTextField(
                title: strings.password,
                controller: passwordController,
                isPasswordVisible: false,
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
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          passwordConfirmation: passwordController.text,
        ),
      );
    }
  }

  _initData() {
    print('profile: ${profile.toJson()}');
    fullNameController.text = profile.name ?? '';
    emailController.text = profile.email ?? '';
    phoneController.text = profile.phone  ?? '';
  }
}
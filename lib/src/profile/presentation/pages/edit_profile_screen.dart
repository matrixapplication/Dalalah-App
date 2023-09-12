import '../../../main_index.dart';
import '../../domain/entities/profile.dart';
import '../widgets/edit_text_form_field.dart';

class EditProfileScreen extends BaseStatelessWidget {
  final Profile profile;
  final Function() onEdit;

  EditProfileScreen({Key? key, required this.profile, required this.onEdit}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: editButton(),
      backgroundColor: context.secondaryContainer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              EditTextField(
                title: strings.email,
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
      onEdit();
    }
  }
}
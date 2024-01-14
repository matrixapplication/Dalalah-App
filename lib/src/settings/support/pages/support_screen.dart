import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:dalalah/core/widgets/buttons/primary_button.dart';
import 'package:dalalah/core/widgets/text-field/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../domain/entities/add_support_params.dart';
import '../../domain/entities/contact_us.dart';
import 'contact_us_widget.dart';

///  Created by harby on 10/12/2023.
class SupportScreen extends BaseStatelessWidget {
  final ContactUs contactUs;
  final Function(AddSupportParams)? onContactUs;
  SupportScreen({super.key, required this.contactUs, this.onContactUs});


  TextEditingController subjectController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final _key = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: 16.paddingAll,
        child: Column(
          children: [
            CustomTextField(
              controller: subjectController,
              hintText: strings.subject,
              keyboardType: TextInputType.number,
            ),
            20.ph,
            CustomTextField(
              controller: contentController,
              hintText: strings.content,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
            20.ph,
            ContactUsWidget(contactUs: contactUs),
            Spacer(),
            PrimaryButton(
              title: strings.submit,
              onPressed: () {
                onSelectedPressed();
              },
            ),
          ],
        ),
      ),
    );
  }


  onSelectedPressed() async {
    if (_key.currentState!.validate()) {
      onContactUs!(AddSupportParams(
        subject: subjectController.text,
        content: contentController.text,
      ));
    }
  }
}

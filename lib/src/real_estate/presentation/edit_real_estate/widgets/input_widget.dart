import 'package:dalalah/core/exceptions/extensions.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/components/base_stateless_widget.dart';
import '../../../../../core/widgets/text-field/custom_text_field.dart';

class InputWidget extends BaseStatelessWidget {
  final String title;
  final TextEditingController? controller;
  dynamic Function(String)? onChanged;
   InputWidget({super.key,required this.title,this.controller,this.onChanged,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: titleSmall,
        ),
        16.ph,
        CustomTextField(
          controller: controller,
          onChanged:(val){
            onChanged!(val);
          },
        ),
      ],
    );
  }
}

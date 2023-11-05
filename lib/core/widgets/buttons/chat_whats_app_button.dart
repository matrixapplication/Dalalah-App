// import 'package:flutter/material.dart';
// import 'package:dalalah/core/utils/helper_methods.dart';
// import 'package:dalalah/core/widgets/buttons/app_icon_button.dart';
//
// import '../../assets/app_icons.dart';
// import '../../components/base_stateless_widget.dart';

import '../../../src/main_index.dart';
import '../../utils/helper_methods.dart';
import 'app_circular_icon_button.dart';

class ChatWhatsAppButton extends BaseStatelessWidget {
  final String phone;
  final Decoration? decoration;

  ChatWhatsAppButton({Key? key, required this.phone, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      padding: 8,
      size: 30,
      circleSize: 45,
      decoration: decoration,
      icon: AppIcons.whatsapp_2,
      backgroundColor: context.cardColor,
      shadowColor: context.cardColor.withOpacity(0.2),
      margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
      onPressed: () => HelperMethods.launchWhatsApp(phone),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:delala/core/utils/helper_methods.dart';
import 'package:delala/core/widgets/buttons/app_icon_button.dart';

import '../../assets/app_icons.dart';
import '../../components/base_stateless_widget.dart';

class ChatWhatsAppButton extends BaseStatelessWidget {
  final String phone;
  ChatWhatsAppButton({Key? key, required this.phone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: theme.colorScheme.secondaryContainer.withOpacity(0.1),
      child: AppIconButton(
        icon: AppIcons.whatsapp,
        color: theme.colorScheme.secondaryContainer,
        onPressed: () {
          HelperMethods.launchWhatsApp(phone);
        },
      ),
    );
  }
}

import 'package:dalalah/core/utils/helper_methods.dart';
import 'package:dalalah/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../routes/app_links_service.dart';
import 'package:uni_links/uni_links.dart';

///  Created by harby on 9/6/2023.
class ShareIconButton extends StatelessWidget {
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final String route;
  final String? id;
  final bool isDecoration;

  const ShareIconButton({Key? key, this.iconColor, this.backgroundColor, this.padding, required this.route, this.id, this.isDecoration = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDecoration ? AppCircularIconButton(
      icon: AppIcons.share,
      color: iconColor ?? context.primaryColor,
      size: 22,
      backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
      shadowColor:backgroundColor ?? context.scaffoldBackgroundColor,
      onPressed: () {
        onShare();
      },
    ) :
     AppIconButton(
      icon: AppIcons.share_solid,
      padding: padding ?? 4.paddingAll,
      color: Colors.white,
      onPressed: () {
        onShare();
      },
    );
  }

  onShare(){
    String url = AppLinkingService.createDynamicLink(route, id: id);
    HelperMethods.copyToClipboard(url);
    Share.share(url);
    //"https://dalalah.co/cars/show/41"
  }
}

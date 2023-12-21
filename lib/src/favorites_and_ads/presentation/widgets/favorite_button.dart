import 'package:dalalah/core/widgets/buttons/app_icon.dart';
import 'package:dalalah/core/widgets/buttons/app_icon_button.dart';
import 'package:dalalah/src/main_index.dart';
import 'package:flutter/material.dart';

import '../../../../core/assets/app_icons.dart';
import '../../../../core/utils/helper_methods.dart';

///  Created by harbey on 10/11/2023.
class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final EdgeInsetsGeometry? margin;
  final double? iconSize;
  final Function()? onToggleFavorite;
  final String? icon;

  const FavoriteButton({
    Key? key,
    this.margin,
    this.isFavorite = false,
    this.iconSize,
    this.onToggleFavorite,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFavorite = this.isFavorite;
    return Container(
      margin: margin,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: OvalBorder(),
        shadows: [
          BoxShadow(
            color: Color(0x3F8D8D8D),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child:  StatefulBuilder(builder: (context, setState) {
          return AppIconButton(
            padding: 7.paddingHoriz + 10.paddingTop + 7.paddingBottom,
            size: iconSize ?? 20,
            icon: icon ?? (isFavorite ? AppIcons.heart_solid : AppIcons.heart),
            color: context.primaryColor,
            onPressed: () async {
              bool isAuth = await HelperMethods.isAuth();
              if(isAuth){
                try {
                  await onToggleFavorite?.call();
                  isFavorite = !isFavorite;
                  setState(() {});
                } on Exception catch (e) {
                  print('onToggleFavorite: $e');
                }
              } else {
                DialogsManager.showErrorDialog(context, context.strings.you_must_login_first);
              }
            },
          );
        }
      ),
    );
  }
}

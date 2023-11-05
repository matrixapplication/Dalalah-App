import 'package:dalalah/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:dalalah/src/main_index.dart';

///  Created by harbey on 9/6/2023.
class ShareIconButton extends StatelessWidget {
  final Color? iconColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const ShareIconButton({Key? key, this.iconColor, this.backgroundColor, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return AppCircularIconButton(
    //   icon: AppIcons.share,
    //   color: iconColor ?? context.errorColor,
    //   size: 22,
    //   backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
    //   shadowColor:backgroundColor ?? context.scaffoldBackgroundColor,
    //   onPressed: () {},
    // );

    return AppIconButton(
      icon: AppIcons.share_solid,
      padding: padding ?? 4.paddingAll,
      color: Colors.white,
      onPressed: () {},
    );
  }
}

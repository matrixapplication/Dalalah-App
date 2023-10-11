import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:delala/src/main_index.dart';

///  Created by harbey on 9/6/2023.
class ShareIconButton extends StatelessWidget {
  final Color? iconColor;
  final Color? backgroundColor;

  const ShareIconButton({Key? key, this.iconColor, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      icon: AppIcons.share,
      color: iconColor ?? context.errorColor,
      size: 22,
      backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
      shadowColor:backgroundColor ?? context.scaffoldBackgroundColor,
      onPressed: () {},
    );
  }
}

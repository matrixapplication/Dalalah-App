import 'package:dalalah/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:dalalah/src/main_index.dart';

///  Created by harby on 9/6/2023.
class FavoriteIconButton extends StatelessWidget {
  final Color? iconColor;
  final double? size;
  final double? circleSize;
  final Color? backgroundColor;

  const FavoriteIconButton({Key? key, this.iconColor, this.backgroundColor, this.size, this.circleSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      icon: AppIcons.heart,
      size: size,
      circleSize: circleSize,
      color: iconColor ?? context.primaryColor,
      backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
      shadowColor: backgroundColor ?? context.scaffoldBackgroundColor,
      onPressed: () {},
    );
  }
}

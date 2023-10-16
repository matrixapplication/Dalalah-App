import 'package:delala/core/widgets/buttons/app_circular_icon_button.dart';
import 'package:delala/src/main_index.dart';

class EditIconButton extends StatelessWidget {
  final Color? iconColor;
  final double? iconSize;
  final double? circleSize;
  final Color? backgroundColor;


  const EditIconButton({
    Key? key,
    this.iconColor,
    this.backgroundColor,
    this.iconSize, this.circleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      circleSize: circleSize,
      icon: AppIcons.edit,
      size: iconSize,
      color: iconColor ?? context.primaryColor,
      backgroundColor: backgroundColor ?? context.scaffoldBackgroundColor,
      shadowColor: backgroundColor ?? context.scaffoldBackgroundColor,
      onPressed: () {},
    );
  }
}

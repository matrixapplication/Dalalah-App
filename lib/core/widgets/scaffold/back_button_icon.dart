import '../../../src/main_index.dart';
import '../buttons/app_circular_icon_button.dart';

class CustomBackButton extends StatelessWidget {
  final bool isPrimaryColor;

  const CustomBackButton({super.key, this.isPrimaryColor = true});

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      margin: 10.paddingAll,
      icon: Icons.arrow_back_ios_rounded,
      padding: 3,
      circleSize: 33,
      radius: 12,
      backgroundColor: isPrimaryColor
          ? context.primaryColor
          : null,
      color: isPrimaryColor
          ? context.scaffoldBackgroundColor
          : context.primaryColor,
      onPressed: () => Navigator.pop(context),
    );
  }
}

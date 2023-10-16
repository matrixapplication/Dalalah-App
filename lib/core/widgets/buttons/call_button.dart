import '../../../src/main_index.dart';
import '../../utils/helper_methods.dart';
import 'app_circular_icon_button.dart';

class CallButton extends StatelessWidget {
  final String phone;
  final double? size;

  const CallButton({Key? key, required this.phone, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCircularIconButton(
      icon: AppIcons.phone_solid,
      backgroundColor: context.cardColor,
      color: context.primaryColor,
      circleSize: 45,
      shadowColor: context.cardColor.withOpacity(0.2),
      padding: 12,
      size: 22,
      margin: const EdgeInsetsDirectional.only(top: 4, end: 4),
      onPressed: () => HelperMethods.launchCallPhone(phone),
    );
  }
}

import '../../../main_index.dart';
import '../../domain/entities/notification.dart';
import '../widgets/notification_item.dart';

class RealEstateScreen extends BaseStatelessWidget {
  final List<Notifications> notifications;

  RealEstateScreen({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      color: context.primaryColor,
      child: Container(
        height: context.height * 0.8,
        width: context.width,
        margin: 40.paddingHoriz,
        alignment: Alignment.center,
        decoration: Decorations.kDecorationBottomRadius(
          color: context.cardColor,
          radius: 20,
        ),
        child: Text(
          strings.soon,
          style: context.bodyLarge,
        ),
      ),
    );
  }
}

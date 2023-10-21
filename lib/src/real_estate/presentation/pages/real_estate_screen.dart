
import '../../../main_index.dart';
import '../../domain/entities/notification.dart';
import '../widgets/notification_item.dart';

class RealEstateScreen extends BaseStatelessWidget {
  final List<Notifications> notifications;
   RealEstateScreen({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(strings.soon),
    );
  }
}

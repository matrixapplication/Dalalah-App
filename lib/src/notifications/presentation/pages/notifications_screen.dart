
import '../../../main_index.dart';
import '../../data/models/notification_dto.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends BaseStatelessWidget {
  final List<NotificationDto> notifications;
   NotificationsScreen({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifications.length,
      padding: 16.paddingAll,
      itemBuilder: (context, index) {
        return NotificationItem(
          notification: notifications[index],
          // isFirst: index == 0 ? true : false,
          // isLast: index == notifications.length - 1 ? true : false,
        );
      },
    );
  }
}

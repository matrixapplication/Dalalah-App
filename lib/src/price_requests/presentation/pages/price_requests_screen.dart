
import '../../../main_index.dart';
import '../../../notifications/data/models/notification_dto.dart';
import '../../../real_estate/domain/entities/notification.dart';
import '../widgets/price_requests_item.dart';

class PriceRequestsScreen extends BaseStatelessWidget {
  final List<NotificationDto> notifications;
   PriceRequestsScreen({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: notifications.length,
      padding: 16.paddingAll,
      itemBuilder: (context, index) {
        return PriceRequestsItem(
          notification: notifications[index],
          isFirst: index == 0 ? true : false,
          isLast: index == notifications.length - 1 ? true : false,
        );
      },
    );
  }
}

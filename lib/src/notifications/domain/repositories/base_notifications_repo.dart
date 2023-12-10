
import '../../data/models/notification_dto.dart';

abstract class BaseNotificationsRepo {
  Future<List<NotificationDto>> fetchNotifications();
}

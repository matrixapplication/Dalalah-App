
import '../entities/notification.dart';

abstract class BaseNotificationsRepo {
  Future<List<Notifications>> fetchNotifications();
}

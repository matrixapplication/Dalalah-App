import 'package:injectable/injectable.dart';

import '../../data/models/notification_dto.dart';
import '../repositories/base_notifications_repo.dart';

@Injectable()
class NotificationsUseCase {
  final BaseNotificationsRepo repository;

  NotificationsUseCase(this.repository);

  Future<List<NotificationDto>> fetchNotifications() async {
    return await repository.fetchNotifications();
  }
}

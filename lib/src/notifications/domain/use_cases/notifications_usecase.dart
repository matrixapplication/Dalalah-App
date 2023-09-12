import 'package:injectable/injectable.dart';

import '../entities/notification.dart';
import '../repositories/base_notifications_repo.dart';

@Injectable()
class NotificationsUseCase {
  final BaseNotificationsRepo repository;

  NotificationsUseCase(this.repository);

  Future<List<Notifications>> fetchNotifications() async {
  //  return await repository.fetchNotifications();
    return [
      Notifications(
        id: 1,
        image: 'https://www.almrsal.com/wp-content/uploads/2019/12/1-1.jpg',
        date: '5 days ago',
        title: 'Sell Your Car In Egypt. Fast',
        time: '5 days ago',
        description: 'Free & Just in One minute Choose your car information → Upload you car images → Get interested calls instantly',
      ),
    ];
  }
}


import 'package:injectable/injectable.dart';

import '../../domain/entities/notification.dart';
import '../../domain/repositories/base_notifications_repo.dart';
import '../data_sources/notifications_datasource.dart';


@Injectable(as: BaseNotificationsRepo)
class WalletRepo extends BaseNotificationsRepo{
  final NotificationsDatasource  datasource;
  WalletRepo(this.datasource);

  @override
  Future<List<Notifications>> fetchNotifications() async{
    final data = await datasource.fetchNotifications();
    return data.data!;
  }

}

import 'package:injectable/injectable.dart';

import '../../domain/repositories/base_notifications_repo.dart';
import '../data_sources/notifications_datasource.dart';
import '../models/notification_dto.dart';


@Injectable(as: BaseNotificationsRepo)
class WalletRepo extends BaseNotificationsRepo{
  final NotificationsDatasource  datasource;
  WalletRepo(this.datasource);

  @override
  Future<List<NotificationDto>> fetchNotifications() async{
    final data = await datasource.fetchNotifications();
    return data.data!;
  }

}
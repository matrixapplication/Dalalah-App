import 'package:injectable/injectable.dart';
import 'package:delala/core/resources/data_state.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/notification.dart';
import '../../domain/use_cases/notifications_usecase.dart';

@Injectable()
class NotificationsCubit extends BaseCubit {
  final NotificationsUseCase usecase;

  NotificationsCubit(this.usecase);

  fetchNotifications() async {
    executeSuccess(() => usecase.fetchNotifications());
  }
}

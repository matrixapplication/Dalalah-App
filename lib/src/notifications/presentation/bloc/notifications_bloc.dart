import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/use_cases/notifications_usecase.dart';

@Injectable()
class NotificationsCubit extends BaseCubit {
  final NotificationsUseCase usecase;

  NotificationsCubit(this.usecase);

  fetchNotifications() async {
    executeSuccess(() => usecase.fetchNotifications());
  }
}

import 'package:injectable/injectable.dart';
import 'package:arabitac/core/resources/data_state.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/notification.dart';
import '../../domain/use_cases/notifications_usecase.dart';

@Injectable()
class NotificationsCubit extends BaseCubit {
  final NotificationsUseCase usecase;

  NotificationsCubit(this.usecase);

  fetchNotifications() async {
    try {
      emit(LoadingStateListener());
      final notifications = await usecase.fetchNotifications();
      emit(DataSuccess<List<Notifications>>(notifications));
    }  catch (e) {
      emit(FailureStateListener(e));
    }
  }
}

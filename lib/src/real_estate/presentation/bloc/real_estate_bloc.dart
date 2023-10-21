import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_cubit.dart';
import '../../domain/use_cases/notifications_usecase.dart';

@Injectable()
class RealEstatePageCubit extends BaseCubit {
  final NotificationsUseCase usecase;

  RealEstatePageCubit(this.usecase);

  fetchNotifications() async {
    executeSuccess(() => usecase.fetchNotifications());
  }
}

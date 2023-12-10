
import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../../real_estate/domain/entities/notification.dart';
import '../bloc/notifications_bloc.dart';
import 'notifications_screen.dart';

class NotificationsPage extends BaseBlocWidget<DataSuccess<List<Notifications>>, NotificationsCubit> {
   NotificationsPage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchNotifications();
   }

   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<Notifications>> state) {
   return NotificationsScreen(
     notifications: state.data!,
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.notifications;
  }
}

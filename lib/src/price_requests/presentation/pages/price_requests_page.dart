
import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../../notifications/data/models/notification_dto.dart';
import '../../../real_estate/domain/entities/notification.dart';
import '../bloc/price_requests_bloc.dart';
import 'price_requests_screen.dart';

class PriceRequestsPage extends BaseBlocWidget<DataSuccess<List<NotificationDto>>, PriceRequestsCubit> {
   PriceRequestsPage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchShowroomCars();
   }

   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<NotificationDto>> state) {
   return PriceRequestsScreen(
     notifications: state.data ?? [],
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.notifications;
  }
}

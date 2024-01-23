
import 'package:dalalah/core/widgets/pagination/pagination_widget.dart';

import '../../../../core/components/base_widget_bloc.dart';
import '../../../main_index.dart';
import '../../../notifications/data/models/notification_dto.dart';
import '../../../real_estate/domain/entities/notification.dart';
import '../../domain/entities/request_price.dart';
import '../bloc/price_requests_bloc.dart';
import 'price_requests_screen.dart';

class PriceRequestsPage extends BaseBlocWidget<DataSuccess<List<RequestPrice>>, PriceRequestsCubit> {
   PriceRequestsPage({Key? key}) : super(key: key);


   @override
   void loadInitialData(BuildContext context) {
     bloc.fetchShowroomCars();
   }

   @override
   Widget? leading(BuildContext context) => 0.ph;

  @override
  Widget buildWidget(BuildContext context, DataSuccess<List<RequestPrice>> state) {
   return PaginationWidget(
     refreshController: bloc.refreshController,
     onRefresh: () => bloc.fetchShowroomCars(isRefresh: true),
     onLoading: () => bloc.fetchShowroomCars(),
     child: PriceRequestsScreen(
       notifications: state.data ?? [],
     ),
   );
  }

  @override
  String? title(BuildContext context) {
    return strings.request_for_quotation;
  }
}
